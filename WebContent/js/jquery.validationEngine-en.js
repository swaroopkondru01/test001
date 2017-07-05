(function($){
    $.fn.validationEngineLanguage = function(){
    };
    $.validationEngineLanguage = {
        newLang: function(){
            $.validationEngineLanguage.allRules = {
                "required": { // Add your regex rules here, you can take telephone as an example
                    "regex": "none",
                    "alertText": "* This field is required",
                    "alertTextCheckboxMultiple": "* Please select an option",
                    "alertTextCheckboxe": "* This checkbox is required",
                    "alertTextDateRange": "* Both date range fields are required",
                    "alertTextselect":"* Please select an option"	
                },
                
                "requiredInFunction": { 
                    "func": function(field, rules, i, options){
                        return (field.val() == "test") ? true : false;
                    },
                    "alertText": "* Field must equal test"
                },
                "dateRange": {
                    "regex": "none",
                    "alertText": "* Invalid ",
                    "alertText2": "Date Range"
                },
                "dateTimeRange": {
                    "regex": "none",
                    "alertText": "* Invalid ",
                    "alertText2": "Date Time Range"
                },
                "minSize": {
                    "regex": "none",
                    "alertText": "* Minimum length should be ",
                    "alertText2": " "
                    
                },
                "minSizeMobile": {
                    "regex": "none",
                    "alertText": "* Minimum ",
                    "alertText2": " digits required"
                }, 
                "minSizeNum": {
                    "regex": "none",
                    "alertText": "* Minimum ",
                    "alertText2": " Numbers required"
                },
                "maxSize": {
                    "regex": "none",
                    "alertText": "* Maximum length should be ",
                    "alertText2": " "
                },
				"groupRequired": {
                    "regex": "none",
                    "alertText": "* You must fill one of the following fields"
                },
                "min": {
                    "regex": "none",
                    "alertText": "* Minimum value is "
                },
                "max": {
                    "regex": "none",
                    "alertText": "* Maximum value is "
                },
                "past": {
                    "regex": "none",
                    "alertText": "* Date prior to "
                },
                "future": {
                    "regex": "none",
                    "alertText": "* Date past "
                },	
                "maxCheckbox": {
                    "regex": "none",
                    "alertText": "* Maximum ",
                    "alertText2": " options allowed"
                },
                "minCheckbox": {
                    "regex": "none",
                    "alertText": "* Please select ",
                    "alertText2": " options"
                },
                "equals": {
                    "regex": "none",
                    "alertText": "* Fields do not match"
                },
                
                "ampersandNotAllowed": {
                    "regex": "none",
                    "alertText": "* & not allowed"
                },
                "notEquals": { 
                    "func": function(field, rules, i, options){

                    	 var a=rules[i+2];
                    	if((field.val()== $("#"+a).val())&&(!(field.val()==null||field.val()==""))){
                    		return false;
                    	}
                    	else
                    		return true;
                   }, 
                    "alertText": "* Old mPIN and New mPIN should not be the same"
                }, 
                "req":{
                	"func": function(field, rules, i, options){
                		
                		if((field.val()==null)||(field.val()== "")){
                			return false;
                		}else
                			return true;
                	},
                	"alertText": "* Please select an option"
                
                	
                },
                
                "notEqualTo": { 
                    "func": function(field, rules, i, options){

                    	 //var x=rules[i+2];
                    	var frmaccnt=$("#fromAccount").val();
                    	if((field.val()== frmaccnt )&& (field.val()!= "")){
                    		return false;
                    	}
                    	else
                    		return true;
                   }, 
                    "alertText": "* From Account and To Account should be different"
                }, 
                
                "creditCard": {
                    "regex": "none",
                    "alertText": "* Invalid credit card number"
                },
                "keyNotAllowed": {
                    "regex": "none",
                    "alertText": "* | not allowed"
                },
                "commaNotAllowed": {
                    "regex": "none",
                    "alertText": "* , not allowed"
                },
                
                "keyNotAlloweds": {
                    "regex": "none",
                    "alertText": "* Not a valid number"
                    
                },
                "phone": {
                    // credit: jquery.h5validate.js / orefalo
                    "regex": /^([\+][0-9]{1,3}[\ \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9\ \.\-\/]{3,20})((x|ext|extension)[\ ]?[0-9]{1,4})?$/,
                    "alertText": "* Invalid phone number"
                },
                "aadharNo": { 
                    "func": function(field, rules, i, options){
                    	
                    	//var pattern = new RegExp(/^[1-9][0-9]{0,10}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	
                    	if(len==12){
                    		return (value.verhoeffCheck()) ? true : false;
                    	}
                    	else
                    		return true;

                    },
                    "alertText": "* Invalid aadhar number"
                },
                "aadharNoAdd": { 
                    "func": function(field, rules, i, options){

                    	var len = field.val().length;

                    	var val1= $("#aadharNumber1").val();
                    	var val2= $("#aadharNumber2").val();
                    	var val3=field.val();
                    	var value= val1+val2+val3;
                      	$("#aadharNumber").val(value);
                    	if(len==4){
                    		return (value.verhoeffCheck()) ? true : false;
                    	}
                    	else
                    		return true;

                    }, 
                    "alertText": "* Invalid aadhar number"
                },
                "mobileNo": { 
                    "func": function(field, rules, i, options){

                    	var pattern = new RegExp(/^[1-9][0-9]{0,10}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;

                    },
                    "alertText": "* Not a valid number"
                }, 
                "dob": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
    					var match = pattern.exec(field.val());

    					if(field.val()=="")    
    						{
    						return true;
    						}
    						if (match == null)
    						{

    					   return true;
    						}

    					var year = match[3];
    					var month = match[2]*1;
    					
    					var day = match[1]*1-1;	
    					
    					var oneYear = 24*60*60*1000*365.25;
    					
    					var today = new Date();
    					var dd = today.getDate();
    					var mm = today.getMonth()+1; //January is 0!
    					var yyyy = today.getFullYear();
    					var formatdate=new Date(yyyy, mm-1, dd);
    					
    					var date = new Date(year, month - 1, day); // because months starts from 0.
    				
    					if(formatdate.getTime()<date.getTime())
    						return false;
    					var diffDays = Math.floor(Math.abs((formatdate.getTime()-date.getTime())/(oneYear)));
    				    					
    					if(diffDays<18)
    						return false; 
    					else return true;

                }, 
                "alertText": "* Age should be greater than 18 years" 
                }, 
                "email": {
                	 "func": function(field, rules, i, options){
                		// HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                     	var pattern = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
                     	var len = field.val().length;
                     	var value = field.val();
                     	if(len!=0){
                     		return (pattern.test(value)) ? true : false;
                     	}
                     	else
                     		return true;
            
                     },
                    "alertText": "* Invalid email address"
                },
                "integer": { 
                    "func": function(field, rules, i, options){
                    	
                    	var pattern = new RegExp(/^[0-9][0-9]{0,10}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
           
                    },
                    "alertText": "* Not a valid Number"
                },
                "int1": { 
                    "func": function(field, rules, i, options){

                    	var pattern = new RegExp(/^[0-9][0-9]{0,20}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;

                    },
                    "alertText": "* Not a valid Number"
                },
                "nationality": { 
                    "func": function(field, rules, i, options){

                    	//var pattern = new RegExp(/^[0-9][0-9]{0,20}$/);
                    	//var pattern ="F";
                    	//var len = field.val().length;
                    	var value = field.val();
                    	//alert("alert"+value);
                    	
                    	if(value=="F"){
                    		//alert("alert again");	
                    		return false;
                    	}
                    	else
                    		return true;
                    },
                    "alertText": "* mRUPEE wallet services are available only for Indian citizens."
                },
                "numberlength": { 
                    "func": function(field, rules, i, options){
                    	
                    	var pattern = new RegExp(/^[0-9][0-9]{0,20}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
           
                    },
                    "alertText": "* Not a valid Number"
                },
                "int": { 
                    "func": function(field, rules, i, options){
                    	
                    	var pattern = new RegExp(/^[0-9][0-9]{0,14}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
           
                    },
                    "alertText": "* Not a valid Number"
                },
                "srn": { 
                    "func": function(field, rules, i, options){
                    	
                    	var pattern = new RegExp(/^[1-9][0-9]{0,15}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
           
                    },
                    "alertText": "* Not a valid Number"
                },
                
                "integer1": {
                    "regex": /^[1-9][0-9]$/,
                    "alertText": "* Not a valid Number"
                },
                "number": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
                    "alertText": "* Invalid floating decimal number"
                },
                "date": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^(0[1-9]|[12][0-9]|3[01])[\/\-\.](0[1-9]|1[012])[\/\-\.](\d{4})$/);
    					var match = pattern.exec(field.val());
    					
    					if(field.val()=="")    
    						{
    						return true;
    						}
    						if (match == null)
    						{
    						
    					   return false;
    						}
    						
    					var year = match[3];
    					var month = match[2]*1;
    					var day = match[1]*1;					
    					var date = new Date(year, month - 1, day); // because months starts from 0.
    					b=date.getFullYear() == year && date.getMonth() == (month - 1) && date.getDate() == day;
    				
    					return b;
       
                },              		
			 "alertText": "* Invalid date, must be in DD/MM/YYYY format" 
                },
                "duration": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
    					var match = pattern.exec(field.val());
    					
    					if(field.val()=="")    
    						{
    						return true;
    						}
    						if (match == null)
    						{
    						
    					   return true;
    						}
    						
    					var year = match[3];
    					var month = match[2]*1;
    					var day = match[1]*1;			
    					var oneDay = 24*60*60*1000;
    					var today = new Date();
    					var dd = today.getDate();
    					var mm = today.getMonth()+1; //January is 0!
    					var yyyy = today.getFullYear();
    					var formatdate=new Date(yyyy, mm-1, dd);
    					var date = new Date(year, month - 1, day); // because months starts from 0.
    					if(formatdate.getTime()<date.getTime())
    						return false;
    					var diffDays = Math.round(Math.abs((formatdate.getTime()-date.getTime())/(oneDay)));
    					if(diffDays>34)
    						return false; 
    					else return true;
       
                },    
			 "alertText": "* Date must be within past 35 days from current date" 
                },
                "durationDet": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
    					var match = pattern.exec(field.val());
    					
    					if(field.val()=="")    
    						{
    						return true;
    						}
    						if (match == null)
    						{
    						
    					   return true;
    						}
    						
    					var year = match[3];
    					var month = match[2]*1;
    					var day = match[1]*1;			
    					var oneDay = 24*60*60*1000;
    					var today = new Date();
    					var dd = today.getDate();
    					var mm = today.getMonth()+1; //January is 0!
    					var yyyy = today.getFullYear();
    					var formatdate=new Date(yyyy, mm-1, dd);
    					var date = new Date(year, month - 1, day); // because months starts from 0.
    					if(formatdate.getTime()<date.getTime())
    						return false;
    					var diffDays = Math.round(Math.abs((formatdate.getTime()-date.getTime())/(oneDay)));
    					if(diffDays>59)
    						return false; 
    					else return true;
       
                },    
			 "alertText": "* Date must be within past 60 days from current date" 
                },
                "durationto": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
    					var match = pattern.exec(field.val());

    					 var a=rules[i+2];
                        var val=$("#"+a).val();
    					var match1=pattern.exec(val);
    					
    					if(field.val()=="")    
    						{
    						return true;
    						}
    						if (match == null)
    						{
    						
    					   return true;
    						}
    					var year = match[3];
    					var month = match[2]*1;
    					var day = match[1]*1;			
    					var oneDay = 24*60*60*1000;
    					var dd = match1[1]*1;
    					var mm =  match1[2]*1; //January is 0!
    					var yyyy = match1[3]*1;
    					var formatdate=new Date(yyyy, mm-1, dd);
    					var date = new Date(year, month - 1, day); // because months starts from 0.
    					if(formatdate.getTime()>date.getTime()) 
    						return false;
 
    					else return true;
       
                },    
			 "alertText": "* Date must be greater than from date " 
                },
                "ipv4": {
                    "regex": /^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
                    "alertText": "* Invalid IP address"
                },
                "url": {
                    "regex": /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
                    "alertText": "* Invalid URL"
                },
                "onlyNumberSp": {
                    "regex": /^[0-9\ ]+$/,
                    "alertText": "Only Numbers Allowed"
                },
                "onlyLetterSp": {
                		"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^[a-zA-Z\ \']+$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
           
                    },	
                    "alertText": "* Letters only"
                },
                
                "onlyLetter": {
            		"func": function(field, rules, i, options){
                	var pattern = new RegExp(/^[a-zA-Z\\']+$/);
                	var len = field.val().length;
                	var value = field.val();
                	if(len!=0){
                		return (pattern.test(value)) ? true : false;
                	}
                	else
                		return true;
       
                },	
                "alertText": "* Letters only"
            },
                
                "specialalphanumeric": {
                	"func": function(field, rules, i, options){
                		var text = field.val();
            			var check = text.split("");
            			var k=0;


            			for (k = 0; k < check.length; k++) {

            				if (check[k]=="|"||check[k]==",") 
                        return false;


                }	return true;
            			}, 
                "alertText": "* | and , not allowed" 
                }, 
                "spacealphanumeric": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^[0-9a-zA-Z\s]*$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
                	},
                    "alertText": "* Only space and alphanumeric values allowed"
                },
                "specialalphabet": {
                	"func": function(field, rules, i, options){
                		var text = field.val();
                		var pattern = new RegExp(/^[0-9]$/);
            			var check = text.split("");
            			var k=0;
           			for (k = 0; k < check.length; k++) {
                    if(pattern.test(check[k]))
	                     return false;
            				if (check[k]=="|"||check[k]==",") 
                        return false;

                }return true;
            			}, 
                        "alertText": "* | , and numbers not allowed "
                },
            			  "spacealphabet": {
                          	"func": function(field, rules, i, options){
                              	var pattern = new RegExp(/^[a-zA-Z\s]*$/);
                              	var len = field.val().length;
                              	var value = field.val();
                              	if(len!=0){
                              		return (pattern.test(value)) ? true : false;
                              	}
                              	else
                              		return true;
                          	},
                              "alertText": "* Only alphabets and space is allowed"
                          }, 
                
                
                
                "onlyLetterNumber": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^[0-9a-zA-Z\\']+$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
                	},
                    "alertText": "* No special characters allowed"
                },
                "onlyLetterNumberWithoutPie": {

                    "regex": /[^|]+$/,
                    "alertText": "* | is not allowed"
                }, 
                // --- CUSTOM RULES -- Those are specific to the demos, they can be removed or changed to your likings
                "ajaxUserCall": {
                    "url": "ajaxValidateFieldUser",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    "alertText": "* This user is already taken",
                    "alertTextLoad": "* Validating, please wait"
                },
				"ajaxUserCallPhp": {
                    "url": "phpajax/ajaxValidateFieldUser.php",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* This username is available",
                    "alertText": "* This user is already taken",
                    "alertTextLoad": "* Validating, please wait"
                },
                "ajaxNameCall": {
                    // remote json service location
                    "url": "ajaxValidateFieldName",
                    // error
                    "alertText": "* This name is already taken",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* This name is available",
                    // speaks by itself
                    "alertTextLoad": "* Validating, please wait"
                },
				 "ajaxNameCallPhp": {
	                    // remote json service location
	                    "url": "phpajax/ajaxValidateFieldName.php",
	                    // error
	                    "alertText": "* This name is already taken",
	                    // speaks by itself
	                    "alertTextLoad": "* Validating, please wait"
	                },
                "validate2fields": {
                    "alertText": "* Please input HELLO"
                },
                
                
                
                "Numberdot": {
                	"func": function(field, rules, i, options){
                		
                    	var pattern = new RegExp(/^[1-9][0-9]*\.?\d{2}$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0)
                    	{
                    		var n=value.split(".");
                    		if(n.length==2)
                    		{
                    			if(!(n[1].length==2))
                    				return false;

                    		}
                    		else
                    			pattern= new RegExp(/^\d*$/);
                    		

                    	}
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
                	},
                    "alertText": "* Enter a valid number with two decimal digits "
                }, 
                
                "Numberdash": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^[0-9\_]*$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
                	},
                    "alertText": "* Not a valid format"
                },
                "Numbercomma": {
                	"func": function(field, rules, i, options){
                    	var pattern = new RegExp(/^[0-9\,]*$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;
                	},
                    "alertText": "* Not a valid format"
                },
                
                
                
                "newNumber": { 
                    "func": function(field, rules, i, options){

                    	var pattern = new RegExp(/^[0-9]*$/);
                    	var len = field.val().length;
                    	var value = field.val();
                    	if(len!=0){
                    		return (pattern.test(value)) ? true : false;
                    	}
                    	else
                    		return true;

                    },
                    "alertText": "* Not a valid Number"
                },
                "zcheck":
            	{
            	"func": function(field, rules, i, options){
            		var value = field.val();
            		if(value.length>0)
            			{
                	var pattern = new RegExp(/^[0]*\.?[0]*$/);
                	if(pattern.test(value)){
            			return false;
            			}
                	else
                		{
                	 return true;
            			}
            			}
            else
            	{
            	return true;
            	}},
                "alertText": "* Field value should not contain all zero's "
                },
                "zcheck":
            	{
            	"func": function(field, rules, i, options){
            		var value = field.val();
            		if(value.length>0)
            			{
                	var pattern = new RegExp(/^[0]*\.?[0]*$/);
                	if(pattern.test(value)){
            			return false;
            			}
                	else
                		{
                	 return true;
            			}
            			}
            else
            	{
            	return true;
            	}},
                "alertText": "* Field value should not contain all zero's "
                },
                
                
                "startZcheck":
            	{
            	"func": function(field, rules, i, options){
            		var value = field.val();
            		if(value.length>0)
            			{
                	var pattern = new RegExp(/^[0][0-9]*$/);
                	if(pattern.test(value)){
            			return false;
            			}
                	else
                		{
                	 return true;
            			}
            			}
            else
            	{
            	return true;
            	}},
                "alertText": "* Field value should not start with zero "
                },
                "amountDMRC":
            	{
            	"func": function(field, rules, i, options){
            		var value = field.val();
            		var len = field.val().length;
            		if(len!=0){
            			if(value<100 || value>1000)
            			{	            				
            				return false;}
            			else
            			{
            				
            				return true;	

            			}}
                else
    			{
    				
    				return true;	

    			}}
            			
            		,
            	
                "alertText": "* Field value should be between 100 and 1000 "
                },
                "notdeciDMRC":
            	{
            	"func": function(field, rules, i, options){
            		var value = field.val();
            		var len = field.val().length;
            		if(len!=0){
            			var check = value.split(".");
            			if(check.length!=1)
            			{	        				
            				return false;
            			}else
            			{
            				return true;	

            			}}
            		else
        			{
        				return true;	

        			}
            	}
            		,

                "alertText": "* Amount should not contain decimal values."
                }, 
            "Amount": {
            	"func": function(field, rules, i, options){                	
                	var pattern = new RegExp(/^[0]*$/);
                	var len = field.val().length;
                	var value = field.val();
                	var n=value.split(".");
                	if(n.length==1)
                		{if(pattern.test(value))
                			return true;
                		pattern=new RegExp(/^[1-9][0-9]*$/);

                		}
                		if(n.length==2)
                	{pattern1=new RegExp(/^[0]*$/);                    	
                	if(pattern1.test(n[0]))
                		{pattern4=new RegExp(/^[0]*$/);
                		if(pattern4.test(n[1]))
                			return true;
                		pattern1=new RegExp(/^[0][1-9]$/);
                		pattern2=new RegExp(/^[1-9][0-9]$/);
                		pattern3=new RegExp(/^[1-9]$/);
                		if(pattern1.test(n[1])||pattern2.test(n[1])||pattern3.test(n[1]))
                			{
                			return true;
                			}
                		else
                			return false;
                		}
                		pattern=new RegExp(/^[1-9][0-9]*\.?[0-9]{1,2}$/);
                	}
                	else if(n.length>2)
                	{
                		return false;

                	}
                	if(len!=0){
                		return (pattern.test(value)) ? true : false;
                	}
                	else
                		return true;
            	},
                "alertText": "* Not a valid format. Valid Format e.g. 125.50"
            },
            
            "AmountFormatDMRC": {
            	"func": function(field, rules, i, options){                	
                	var pattern = new RegExp(/^[0]*$/);
                	var len = field.val().length;
                	var value = field.val();
                	var n=value.split(".");
                	if(n.length==1)
                		{if(pattern.test(value))
                			return true;
                		pattern=new RegExp(/^[1-9][0-9]*$/);

                		}
                		if(n.length==2)
                	{pattern1=new RegExp(/^[0]*$/);                    	
                	if(pattern1.test(n[0]))
                		{pattern4=new RegExp(/^[0]*$/);
                		if(pattern4.test(n[1]))
                			return true;
                		pattern1=new RegExp(/^[0][1-9]$/);
                		pattern2=new RegExp(/^[1-9][0-9]$/);
                		pattern3=new RegExp(/^[1-9]$/);
                		if(pattern1.test(n[1])||pattern2.test(n[1])||pattern3.test(n[1]))
                			{
                			return true;
                			}
                		else
                			return false;
                		}
                		pattern=new RegExp(/^[1-9][0-9]*\.?[0-9]{1,2}$/);
                	}
                	else if(n.length>2)
                	{
                		return false;

                	}
                	if(len!=0){
                		return (pattern.test(value)) ? true : false;
                	}
                	else
                		return true;
            	},
                "alertText": "* Not a valid format"
            },
            "alphanumeric": {
            	"func": function(field, rules, i, options){
                	var pattern = new RegExp(/^[0-9a-zA-Z]*$/);
                	var len = field.val().length;
                	var value = field.val();
                	if(len!=0){
                		return (pattern.test(value)) ? true : false;
                	}
                	else
                		return true;
            	},
                "alertText": "* Please enter only alphanumeric values."
            },
            
            "promocode": { 
                "func": function(field, rules, i, options){
                	
                	//var pattern = new RegExp(/^[1-9][0-9]{0,10}$/);
                	var len = field.val().length;
                	var value = field.val();
                	
                	if(value=="SBC15"){
                		return true;
                	}
                	else
                		return false;

                },
                "alertText": "* Invalid Promo Code"
            },

	            //tls warning:homegrown not fielded 
                "dateFormat":{
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/,
                    "alertText": "* Invalid Date"
                },
                //tls warning:homegrown not fielded 
				"dateTimeFormat": {
	                "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/,
                    "alertText": "* Invalid Date or Date Format",
                    "alertText2": "Expected Format: ",
                    "alertText3": "mm/dd/yyyy hh:mm:ss AM|PM or ", 
                    "alertText4": "yyyy-mm-dd hh:mm:ss AM|PM"
	            }
                
               
            };   
        }
        
    };

    $.validationEngineLanguage.newLang();
    
})(jQuery);
