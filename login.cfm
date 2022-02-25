<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="./css/all.min.css" rel="stylesheet"/>
    </head>
    <body>
		<!--- initialize session values --->
		<cflock scope="SESSION" timeout="20" throwontimeout="No" type="EXCLUSIVE">
			<cfparam name="Session.UserName" default="">
			<cfparam name="Session.Password" default="">
		</cflock>

		<!--- initialize page variables --->
		<cfset sectionName="admin">
		<cfset pgTitle="Log In">
		<cfset path="">
		<cfparam name="buttontext" default="Log In">
		<!-- if login variable is NOT defined, then set the focus on the username field --->
		<cfif not isDefined("login")>
			<cfset bodyTagVar="onLoad=""document.login.userName.focus();""">
		</cfif>

		<!--- initialize status message --->
		<cfparam name="caption" type="string" default="Please Log In">
		<cfif isDefined("url.status")>
			<cfset caption = #URL.status#>
		</cfif>


		<!--- If login variable is defined (i.e. the form has been submitted), do this block --->
		<cfif isDefined("URL.login")>
			
			<!--- check to see if username and password is a match --->
			<cflock scope="session" timeout="20" type="readonly">
				<cfquery name="authUser" datasource="cfsample">
					SELECT register_id
					FROM register
					WHERE (register.userName = '#trim(URL.userName)#' AND register.password = '#trim(URL.password)#')
				</cfquery>
			</cflock>
			
			<!--- if the returned recordcount is 1, lockdown and set the session variables --->
			<cfif authUser.recordcount EQ 1>
				
				<!--- if rememberLogin value is set, set a cookie --->
				<cfif isDefined("URL.rememberLogin")>
					<cfif URL.rememberLogin is TRUE>
						<cfcookie name="byLogin" value="#URL.userName#:#URL.password#" expires="90">
					</cfif>
				</cfif>
				
				<!--- lockdown and set the session variables, redirect to the admin section --->
				<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
					<cfset SESSION.userName = URL.userName>
					<cfset SESSION.password = URL.password>
					<cfset SESSION.authenticated = "true">
				</cflock>
				<!--- this is a workaround, setting a cookie immediately before a cflocation causes the cookie to not be set; use the META tag instead --->
				<meta http-equiv="Refresh" content="0; url=admin/">
				<!--- <cflocation url="admin/" addtoken="no"> --->
					<cfabort>
					
				<!--- otherwise, redirect to login and set status to "failed" --->
			<cfelse>
				<cflocation url="login.cfm?status=failed" addtoken="No">
					<cfabort>
			</cfif>
			
		<!--- if URL.login isn't defined, then display the form --->
		<cfelseif isDefined("URL.changepw")>

			<cfquery name="authUserPW" datasource="cfsample">
				SELECT register_id
				FROM register
				WHERE (register.userName = '#trim(URL.userName)#' AND register.password = '#trim(URL.password)#')
			</cfquery>
			<cfif URL.password1 IS URL.password2>
				<cfif authUserPW.recordcount EQ 1>
					<cflock timeout="30" throwontimeout="No" type="EXCLUSIVE">
						<cfquery name="changePW" datasource="cfsample" >
							UPDATE register
							SET password = '#Trim(URL.password1)#'
							WHERE userName = '#Trim(URL.userName)#'
						</cfquery>
					</cflock>
					
					<div align="center"><b class="error">Your password has been changed.</b></div>
				<cfelse>
					<cflocation url="login.cfm?status=nousermatch&display=changepw" addtoken="No">
				</cfif>
			<cfelse>
				<cflocation url="login.cfm?status=nopwmatch" addtoken="No">
			</cfif>
		<cfelseif isDefined("URL.adduser")>
			<cflock timeout="30" throwontimeout="No" type="EXCLUSIVE">
				<cfquery name="addUser" datasource="cfsample" >
					INSERT INTO register(username, password)
					VALUES ('#userName#', '#password#')
				</cfquery>
			</cflock>
			
			<div align="center"><b class="error">User has been added</b></div>
		<cfelse>

			<!--- if url.statis is defined and the value is "logout"... --->
			<cfif isDefined("URL.status") AND (status IS "logout")>

				<!--- if the cookie is defined, expire it immediately --->
				<cfif isDefined("COOKIE.byLogin")>
					<cfif Len(COOKIE.byLogin) GT 0>
						<cfcookie name="byLogin" value="" expires="NOW">
					</cfif>
				</cfif>
				
				<!--- lockdown the session and delete the userName and password values --->
				<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
				<CFIF (ParameterExists(Session.authenticated))> 
					<CFSCRIPT> 
						StructDelete(session, "userName"); 
						StructDelete(session, "password"); 
						StructDelete(session, "authenticated");
					</CFSCRIPT> 
				</CFIF>
				</cflock>
				<meta http-equiv="Refresh" content="0; url=login.cfm">
			</cfif>
			
			<!--- and display the URL... ---> 
			<div class="container">
				<div class="row">
					<div class="col-md-12">
				
						<!--- caption, display error or status message depending on what has happened --->
						<caption><cfif isDefined("URL.status") AND (status IS "failed")>
							<b class="error">Incorrect login.</b>
						<cfelseif isDefined("URL.display") AND (display IS "changepw")>
							<b class="error">Change Password</b>
						<cfelseif isDefined("URL.display") AND (display IS "adduser")>
							<b class="error">Add User</b>
						<cfelseif isDefined("URL.status") AND (status IS "nopwmatch")>
							<b class="error">New passwords do not match.</b>
						<cfelseif isDefined("URL.status") AND (status IS "nousermatch")>
							<b class="error">Invalid username.</b>
						<cfelseif isDefined("URL.status") AND (status IS "error")>
							<b class="error"><cfoutput>#errorMessage# is empty.</cfoutput></b>
						<cfelseif isDefined("URL.status") AND (status IS "logout")>
							<cfif NOT isDefined("SESSION.userName")><b class="error">Logout Successful.</b></cfif>
						<cfelse>
							<b>Please Log In</b>
						</cfif></caption>
						<form action="<cfoutput>#CGI.script_name#</cfoutput>" method="get" name="login" id="login">
						<cfif isDefined("display") AND display IS "changepw">
						<input type="hidden" name="changepw" value="true">
						<cfElseIf isDefined("display") AND display IS "adduser">
						<input type="hidden" name="adduser" value="true">
						<cfelse>
						<input type="hidden" name="login" value="true">
						</cfif>
							<div class="form-group">
								<label>User Name</label>
								<td><input type="Text" name="userName" class="form-control" message="User Name is required" required="Yes" size="10" maxlength="12" id="userName"></td>
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" class="form-control" message="Password is required" required="Yes" size="10"  id="password">
							</div>
						<cfif isDefined("display") AND display IS "changepw">
							<div class="form-group">
								<label class="formRequired" align="right">New Password</label>
								<input type="password" name="password1" class="form-control" message="New Password is required" required="Yes" size="10" maxlength="12" id="password1">
							</div>
							<div class="form-group">
								<label class="formRequired" align="right">Confirm</label>
								<input type="password" name="password2" class="form-control" message="Password is required" required="Yes" size="10" maxlength="12" id="password">
							</div>
							<cfset buttontext = "Change Password">
						</cfif>
							<div >
								<input type="checkbox" name="rememberLogin" id="rememberLogin" value="true"><label for="rememberLogin"> Remember login</label>
							</div>
							<div class="form-group">
								<label> </label>
								<input type="submit" class="btn btn-success" value="<cfoutput>#buttontext#</cfoutput>">
							</div>
						</form>
					</div>
				</div>
			</div>
		</cfif>
	</body>
</html>