module A2L

  Modules="/Modules/"
  
  require "mustache"
  require File.dirname(__FILE__) + Modules + "A2LRender.rb"

  Begin_A2ML=true
  End_A2ML=true


  def A2L.Generate
  	
    if defined? ASAP2_Version then
      puts A2LRender._ASAP2Version(ASAP2_Version)
    end

  	if defined? Header then 
  		puts A2LRender._Header(Header) 
  	end

    if defined? Begin_A2ML then
      puts A2LRender._Begin_A2ML()
    end

    if defined? CCPConfig then
      puts A2LRender._CCPConf(CCPConfig)
    end
  	
    if defined? XCPConfig then
      puts A2LRender._XCPConf(XCPConfig)
    end

    if defined? CANAPEIni then
      puts A2LRender._CANAPEIni()
    end

    if defined? CreateIni then
      puts A2LRender._CreateIni()
    end

    if defined? CANAPEExt then
      puts A2LRender._CANAPEExt()
    end

    if defined? CANAPE_KWP_On_CAN then
      puts A2LRender._CANAPE_KWP_On_CAN()
    end

    if defined? KWP2000_ETAS then
      puts A2LRender._KWP2000_ETAS()
    end

    if defined? ETK_ETAS then
      puts A2LRender._ETK_ETAS()
    end

    if defined? End_A2ML then
      puts A2LRender._End_A2ML()
    end

    if defined? Visu_Package_Info then
      puts A2LRender._Visu_Package_Info()
    end

    if defined? CCP_Visu then
      puts A2LRender._CCP_Visu()
    end

    if defined? ASAP1B_KW2000 then
      puts A2LRender._ASAP1B_KW2000()
    end

    if defined? ASAP1B_CCP then
      puts A2LRender._ASAP1B_CCP()
    end        

    if defined? CANAPE_Create_Ini then
      puts A2LRender._CANAPE_Create_Ini()
    end        

  	if defined? ModCommon then 
  		puts A2LRender._ModCommon(ModCommon) 
  	end
  	
  	if defined? Measurement then 
  		puts A2LRender._Measurement(Measurement) 
  	end

    if defined? Characteristic then 
      puts A2LRender._Characteristic(Characteristic) 
    end   
	
  	if defined? CompuMethod then 
  		puts A2LRender._CompuMethod(CompuMethod) 
  	end
  	
  end

end
