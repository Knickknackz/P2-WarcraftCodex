public class compareCharacterController {
	@AuraEnabled
    public static List<characterWrapper> getCharacters(Boolean healer){
        List<characterWrapper> cWrapList = new List<characterWrapper>();
        List<Character__c> fullCList = new List<Character__c>();
        if(healer){
            fullCList = [Select Id, Name, Class__c, CharacterURL__c, (SELECT Name, Percentile__c FROM Rankings__r WHERE Spec__c  LIKE 'Healer') From Character__c  WITH SECURITY_ENFORCED];
        }else{
            fullCList = [Select Id, Name, Class__c, CharacterURL__c, (SELECT Name, Percentile__c FROM Rankings__r WHERE (NOT Spec__c  LIKE 'Healer')) From Character__c  WITH SECURITY_ENFORCED];
        }
            for(Character__c c: fullCList){
                characterWrapper cWrap = new characterWrapper();
                Integer count = 0;
                Decimal total = 0;
                cWrap.charURL = '/character/' + c.Id;
                for(Ranking__c r: c.Rankings__r){
                    Double percentile = r.Percentile__c.setScale(1);
                    count += 1;
                    total += percentile;
                    String format;
                    if(percentile >= 99){
                        format = 'tier5';
                    }else if(percentile >= 90){
						format = 'tier4';
                    } else if(percentile >= 75){
                    	format = 'tier3';           
                    } else if(percentile >= 50){
                    	format = 'tier2';            
                    } else if(percentile >= 25){
                    	format = 'tier1';            
                    } else{
                        format = 'tier0';
                    }
                    
                    switch on r.Name{
                        when 'Anub\'Rekhan'{
                            cWrap.anub = percentile;
                            cWrap.anubF = format;
                        }
                        when 'Gluth'{
                            cWrap.gluth = percentile;
                            cWrap.gluthF = format;
                        }
                        when 'Gothik the Harvester'{
                            cWrap.gothik = percentile;
                            cWrap.gothikF = format;
                        }
                        when 'Grand Widow Faerlina'{
                            cWrap.faerlina = percentile;
                            cWrap.faerlinaF = format;
                        }
                        when 'Grobbulus'{
                            cWrap.grob = percentile;
                            cWrap.grobF = format;
                        }
                        when 'Heigan the Unclean'{
                            cWrap.heigan = percentile;
                            cWrap.heiganF = format;
                        }
                        when 'Instructor Razuvious'{
                            cWrap.razuvious = percentile;
                            cWrap.razuviousF = format;
                        }
                        when 'Kel\'Thuzad'{
                            cWrap.kt = percentile;
                            cWrap.ktF = format;
                        }
                        when 'Loatheb'{
                            cWrap.loatheb = percentile;
                            cWrap.loathebF = format;
                        }
                        when 'Maexxna'{
                            cWrap.maexx = percentile;
                            cWrap.maexxF = format;
                        }
                        when 'Noth the Plaguebringer'{
                            cWrap.noth = percentile;
                            cWrap.nothF = format;
                        }
                        when 'Patchwerk'{
                            cWrap.patch = percentile;
                            cWrap.patchF = format;
                        }
                        when 'Sapphiron'{
                            cWrap.sapph = percentile;
                            cWrap.sapphF = format;
                        }
                        when 'Thaddius'{
                            cWrap.thad = percentile;
                            cWrap.thadF = format;
                        }
                        when 'The Four Horsemen'{
                            cWrap.fourhorse = percentile;
                            cWrap.fourhorseF = format;
                        }
                    }
                }
                cWrap.cName = c.Name;
                cWrap.class_Z = c.Class__c;
                
                Decimal avg;
                if(count ==0){
                    avg = 0;
                }else{
                    avg = total/count;
                }                
                String avgFormat;
                if(avg > 90){
					avgFormat = 'tier4';
                } else if(avg > 75){
                    avgFormat = 'tier3';           
                }else if(avg > 50){
                    avgFormat = 'tier2';            
                }else if(avg > 25){
                    avgFormat = 'tier1';            
                }else{
                    avgFormat = 'tier0';
                }
                cWrap.avg = avg.setScale(1);
                cWrap.avgF = avgFormat;
                cWrapList.add(cWrap);
                
            }
        System.debug(cWrapList);
        return cWrapList;
    }
    
    
    public class characterWrapper{
        @AuraEnabled
        public String cName{get;set;}
        @AuraEnabled
        public String class_Z{get;set;}
        @AuraEnabled
        public Double avg{get;set;}
		@AuraEnabled
        public String avgF{get;set;}        
        @AuraEnabled
        public String charURL{get;set;}
        
        //abom wing
        @AuraEnabled
        public Double patch{get;set;}
        @AuraEnabled
        public Double grob{get;set;}
        @AuraEnabled
        public Double gluth{get;set;}
        @AuraEnabled
        public Double thad{get;set;}
        
        //spider wing
        @AuraEnabled
        public Double anub{get;set;}
        @AuraEnabled
        public Double faerlina{get;set;}
        @AuraEnabled
        public Double maexx{get;set;}
        
        //plague wing
        @AuraEnabled
        public Double noth{get;set;}
        @AuraEnabled
        public Double heigan{get;set;}
        @AuraEnabled
        public Double loatheb{get;set;}
        
        //dk wing
        @AuraEnabled
        public Double razuvious{get;set;}
        @AuraEnabled
        public Double gothik{get;set;}
        @AuraEnabled
        public Double fourhorse{get;set;}
        
		//final 2
        @AuraEnabled
        public Double sapph{get;set;}
        @AuraEnabled
        public Double kt{get;set;}

		//FORMATTING        
        //abom wing
        @AuraEnabled
        public String patchF{get;set;}
        @AuraEnabled
        public String grobF{get;set;}
        @AuraEnabled
        public String gluthF{get;set;}
        @AuraEnabled
        public String thadF{get;set;}
        
        //spider wing
        @AuraEnabled
        public String anubF{get;set;}
        @AuraEnabled
        public String faerlinaF{get;set;}
        @AuraEnabled
        public String maexxF{get;set;}
        
        //plague wing
        @AuraEnabled
        public String nothF{get;set;}
        @AuraEnabled
        public String heiganF{get;set;}
        @AuraEnabled
        public String loathebF{get;set;}
        
        //dk wing
        @AuraEnabled
        public String razuviousF{get;set;}
        @AuraEnabled
        public String gothikF{get;set;}
        @AuraEnabled
        public String fourhorseF{get;set;}
        
		//final 2
        @AuraEnabled
        public String sapphF{get;set;}
        @AuraEnabled
        public String ktF{get;set;}
        
        public characterWrapper(){
            this.patch=0;
            this.grob=0;
            this.gluth=0;
            this.thad=0;
            this.anub=0;
            this.faerlina=0;
            this.maexx=0;
            this.noth=0;
            this.heigan=0;
            this.loatheb=0;
            this.razuvious=0;
            this.gothik=0;
            this.fourhorse=0;
            this.sapph=0;
            this.kt=0;
            
            this.patchF='tier0';
            this.grobF='tier0';
            this.gluthF='tier0';
            this.thadF='tier0';
            this.anubF='tier0';
            this.faerlinaF='tier0';
            this.maexxF='tier0';
            this.nothF='tier0';
            this.heiganF='tier0';
            this.loathebF='tier0';
            this.razuviousF='tier0';
            this.gothikF='tier0';
            this.fourhorseF='tier0';
            this.sapphF='tier0';
            this.ktF='tier0';
        }
         
    }
}