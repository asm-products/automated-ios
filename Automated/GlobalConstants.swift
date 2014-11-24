//
//  GlobalConstants.swift
//  Automated
//
//  Created by Nick Babenko on 24/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation

class GlobalConstants {
	
	class var UrlNestApi:String								{ return "http://developer-api.nest.com" }
	class var UrlNestAuthentication:String					{ return "https://home.nest.com/login/oauth2" }
	class var UrlNestRedirect:String							{ return "http://localhost/success" }
	class var UrlNestToken:String							{ return "https://api.home.nest.com/oauth2/access_token" }
	
	class var OAuthTypeNest:String							{ return "Nest" }
	
	class var OAuthClientIdNest:String						{ return "65213391-3d53-4820-a8be-2210656209cf" }
	class var OAuthClientSecretNest:String					{ return "67agUmMqcobOZQPvLsGX20Ynw" }
	
	class var KeyNestOAuthAccessToken:String		{ return "KeyNestOAuthAccessToken" }
	
}