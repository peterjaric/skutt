class UrlMappings {

	static mappings = {

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}	
		"/"(controller:'book', action:'list')
		"500"(view:'/error')
	}
}
