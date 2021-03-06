#Include all the Libraries necessary for A2L Rendering

require File.dirname(__FILE__)+"/A2L.rb"

# => I am more obsessed with Hashes and In Fact almost 95% of the operations
# => in this tool will entirely happen only in Hash
# => If you are not sure of What is a Hash,Please Read about Hashes in Wiki
# => Before Proceeding Further
# => Do no Change the Names of the Hashes used.If you are changing the Names
# => Then you should respectively be changing it in A2LRender.rb
# => Regrets Anyways!!!

#This works based on Different Hash Values
#These Hash Names are HardCoded Like Header,ModCommon,Measurement etc.,
#Based on these Hash Names the A2L will be rendered accordingly
#If you hate these Names and you want to update with your own Hashes then you should be poking 
#your head in to the Modules\A2L_Render.rb and Customizing the Hash Names for their Respective Template

Measurement=Hash.new

# => Define the HEADER Details of the A2L
Header= {
  			"HEADER"=>"Sample A2L File",
  			"VERSION"=>45,
  			"PROJECT_NO"=>12312
}

# => Define the Common Module Details of the ECU
ModCommon= {
			"MOD_COMMON"=>nil,
			"DEPOSIT_ABSOLUTE"=>nil,
			"BYTE_ORDER"=>"MSB_LAST",
			"ALIGNMENT_BYTE"=>1,
			"ALIGNMENT_WORD"=>2,
			"ALIGNMENT_LONG"=>4,
			"ALIGNMENT_FLOAT32"=>4,
			"ALIGNMENT_FLOAT64"=>4
}

# => Initiate Only 1 Variable in the whole Configuration
# => This Example is useless because in Real Time 
# => a Typical ECU will contain a minimum of 65000 to 2 Lakh Variables

Measurement ={1=>{
			"ECU_VARIABLE"=>"Variable 1",
			"DESCRIPTION"=>"This is a Sample Description for this Variable",
			"DATATYPE"=>"uint8",
			"COMPU_METHOD"=>"Sample_Compu_Method",
			"DEFAULT_MIN"=>0,
			"DEFAULT_MAX"=>1,
			"MINIMUM"=>-128,
			"MAXIMUM"=>127,
			"BITMASK"=>"0x0000FF",
			"ECU_ADDRESS"=>"0x0000BB",
			"INTERNAL_TYPE"=>"BYTE",
			"USER_DEFINED"=>"You can give any comment as you wish.This will be appended as a comment in the Description"
}}

################################################################################################################
#									FOR CREATING MULTIPLE VARIABLES  																				
#				
# => In Order to Create One Such you have to use a Two Level Hashing
# => Either you can use your variable or anonymous hashing to create multiple variables
# => In our first case I have created two hashes
# => First Hash Containing Key '1'
# => Second Hash Containing Multiple keys from 'ECU_VARIABLE','DESCRIPTION' till 'INTERNAL_TYPE'
# => The Key value in the First Hash does not matter.It can be anything like 'apple','dog','cement' anything
# => But for Readability I have used number '1' as Key
# => So like this you can create innumerous keys and variable details
# => An Example Implementation is below for Multiple Variables
#
# => Example : Create 10 Variables with Dummy Variable Details
#
# => for i in 1..10
#  		Variable_Details=Hash.new
#  		Variable_Details["ECU_VARIABLE"]='Variable_Name'
#  		Varible_Details["DATATYPE"]='asfdasf'
#  		Measurement[i]=Variable_Details
# => end
#
#
# => The Above Snippet would do the work for you.But the trick is here you should think your own logic
# => to update the Variable_Details Hash with your own Value
################################################################################################################


for i in 2..100
  Variable_Details=Hash.new
  Variable_Details["ECU_VARIABLE"]="Variable" + i.to_s
  Variable_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for this Variable"
  Variable_Details["DATATYPE"]="uint8" + i.to_s
  Variable_Details["COMPU_METHOD"]="Sample_Compu_Method" + i.to_s
  Variable_Details["DEFAULT_MIN"]=0
  Variable_Details["DEFAULT_MAX"]=1
  Variable_Details["MINIMUM"]=-128
  Variable_Details["MAXIMUM"]=127
  Variable_Details["BITMASK"]="0x0000FF"
  Variable_Details["ECU_ADDRESS"]="0x0000BB"
  Variable_Details["INTERNAL_TYPE"]="BYTE"
  Variable_Details["USER_DEFINED"]="What the Hell is Happening" + i.to_s
  Measurement[i]=Variable_Details
end


# => Initiate Only 1 Variable in the whole Configuration
# => This Example is useless because in Real Time 
# => a Typical ECU will contain a minimum of 65000 to 2 Lakh Variables

Characteristic ={1=>{
			"ECU_VARIABLE"=>"Variable 1",
			"DESCRIPTION"=>"This is a Sample Description for this Variable",
      "ECU_ADDRESS"=>"0x0000BB",
      "RECORD_LAYOUT"=>"0x0000BB",     
			"DEFAULT_VALUE"=>24,
			"COMPU_METHOD"=>"Sample_Compu_Method",
			"MINIMUM"=>-128,
			"MAXIMUM"=>127,
			"USER_DEFINED"=>"You can give any comment as you wish.This will be appended as a comment in the Description"
}}


# => Hash Containing the Interpolation values
Interpolation={1=>2,2=>456,3=>4,5=>6}

# => Hash Containing the Verbal Formula values
Verbal_Formula={1=>{2=>"Sawtooth"},2=>{789=>"Square Wave"},3=>{900=>"Sine wave"},5=>{1055=>"Cos Wave"}}
# => Verbal_Formula={1=>"ts",2=>"23",3=>"asdfasdf"}
# => If you are planning to use Verbal Formula Range then the Hashes should be 2 Level like
# => Verbal_Formula={
# => 		1=>{15=>"A"},  	# This will assign for Values from 1 to 15 as "A"
# => 		16=>{35=>"B"}}	# This will assign for Values from 16 to 35 as "B"

# Verbal_Formula={1=>"Sawtooth",2=>"Square Wave",3=>"Sine wave",5=>"Cos Wave"}
CompuMethod={1=>{
		"NAME"=>"Sample Compu Method",
		"DESCRIPTION"=>"Sample Description for Compu Method",
		"COMPU_METHOD_TYPE"=>"TAB_VERB",
		"PHYSICAL_REP"=>"%56.6",
		"UNIT"=>"m/s",
		"COEFF_TYPE"=>"COEFFS",
		"COEFF_A"=>0,
		"COEFF_B"=>45,
		"COEFF_C"=>56,
		"COEFF_D"=>12313,
		"COEFF_E"=>13,
		"COEFF_F"=>10,
		"FORMULA"=>"X+4",
		"FORMULA_INV"=>"X-4",
		"COMPU_TAB_REF"=>"ABCD",
		"COMPU_TAB_DESCRIPTION"=>"Sample Tab Verb Formula",
		"INTERPOLATION"=>"DISABLE",
		"INTERPOLATION_VALUES"=>Interpolation, 
		"DEFAULT_VALUE"=>"55",
		"VERB_RANGE"=>"ENABLE",
		"COMPU_VTAB_VALUES"=>Verbal_Formula, 
		"DEFAULT_VALUE"=>""			
}}

CompuMethod1=Hash.new

for i in 2..100
  Compu_Details=Hash.new
  Compu_Details["NAME"]="Compu Method" + i.to_s
  Compu_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for this Compu Method"
  Compu_Details["COMPU_METHOD_TYPE"]="lin"
  Compu_Details["PHYSICAL_REP"]="%4.5"
  Compu_Details["UNIT"]="No Unit" + " " + i.to_s
  Compu_Details["COEFF_TYPE"]="COEFFS"
  Compu_Details["COEFF_A"]=i++
  Compu_Details["COEFF_B"]=i++
  Compu_Details["COEFF_C"]=i++
  Compu_Details["COEFF_D"]=i++
  Compu_Details["COEFF_E"]=i
  CompuMethod[i]=Compu_Details
end


CCPConfig=Hash.new
CCPConfig["DESCRIPTOR_FOR_CCP"]="Welcome to CCP"


XCPConfig=Hash.new

XCPConfig["DESCRIPTOR_FOR_XCP"]="Hi and Welcome to XCP Configuration using A2L Generator"
XCPConfig["ECU_ACCESS"]="ALLOWED"
XCPConfig["XCP_READ_ACCESS"]="NOT ALLOWED"
XCPConfig["XCP_WRITE_ACCESS"]="ALLOWED"
XCPConfig["DAQ_SUPPORT"]=false

CANAPEIni=true
CreateIni=true
CANAPEExt=true
CANAPE_KWP_On_CAN=true
KWP2000_ETAS=true
ETK_ETAS=true
CCP_Visu=true
ASAP1B_KW2000=true
ASAP1B_CCP=true
CANAPE_Create_Ini=true
Visu_Package_Info={"PACKAGE_INFORMATION"=>"VMH7B000_DELIV_3"}

ASAP2_Version={"ASAP2_VERSION"=>1.56}

Project={
	"NAME"=>"SAMPLE Project",
	"DESCRIPTION"=>"I dont know what to give as the description of this project"
}

Module={
	"NAME"=>"SAMPLE Module",
	"DESCRIPTION"=>"I dont know what to give as the description of this Module"
}
Data_Memory=Hash.new
Variable_Memory=Hash.new
System_Constant=Hash.new

for i in 1..2
  Memory_Details=Hash.new
  Memory_Details["NAME"]="Data Memory" + i.to_s
  Memory_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for the Data Memory"
  Memory_Details["MODE"]="INTERN"
  Memory_Details["ORIGIN_ADDR"]="0x0000BB" + i.to_s
  Memory_Details["LENGTH"]="0x0000BB" + (i+1).to_s
  Memory_Details["MAPPING_ADDR"]="0x0000BB" + (i+2).to_s
  Memory_Details["OFFSET_ADDR"]="-1 -1 -1 -1"
  Memory_Details["COMMUNICATION_INTERFACE"]="ETK"
  Data_Memory[i]=Memory_Details
end

for i in 1..2
  Memory_Details=Hash.new
  Memory_Details["NAME"]="Data Memory" + i.to_s
  Memory_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for the Data Memory"
  Memory_Details["MODE"]="INTERN"
  Memory_Details["ORIGIN_ADDR"]="0x0000BB" + i.to_s
  Memory_Details["LENGTH"]="0x0000BB" + (i+1).to_s
  Memory_Details["MAPPING_ADDR"]="0x0000BB" + (i+2).to_s
  Memory_Details["OFFSET_ADDR"]="-1 -1 -1 -1"
  Memory_Details["COMMUNICATION_INTERFACE"]="ETK"
  Variable_Memory[i]=Memory_Details
end

for i in 1..5
  Memory_Details=Hash.new
  Memory_Details["NAME"]="Data Memory" + i.to_s
  Memory_Details["VALUE"]=(i+1).to_s
  # Memory_Details=Hash.new
  # Memory_Details["NAME"+i.to_s]=(i+1).to_s
  System_Constant[i]=Memory_Details
  # System_Constant=Memory_Details
 end

 Calibration_Method=Hash.new
 Calibration_Method["NAME"]="Test Calibration"
 Calibration_Method["VERSION"]=32
 Calibration_Method["START_ADDR"]="0xa001C000"
 Calibration_Method["LENGTH"]="0x00124000"

 Mod_Par=Hash.new
 Mod_Par["DESCRIPTION"]=""
 Mod_Par["INTERFACES"]=1
 Mod_Par["VERSION"]=45
 Mod_Par["EPK_ADDR"]="0xA001C000"
 Mod_Par["PROJECT_NAME"]="Test Project Created using A-To-L"
 Mod_Par["SUPPLIER_NAME"]="BOSCH"
 Mod_Par["CUSTOMER_NAME"]="BMW"
 Mod_Par["CUSTOMER_NUMBER"]="12345"
 Mod_Par["USER_NAME"]="Unknown"
 Mod_Par["USER_PHONE_NUMBER"]="Who Cares!!"
 Mod_Par["CONTROLLER_NAME"]="Some Useless Controller"
 Mod_Par["ECU_NAME"]="Anyways the Car will Crash"
 Mod_Par["CALIBRATION_OFFSET"]="0x0000"

 Code_Memory=Hash.new
 Code_Memory["NAME"]="Code Memory"
 Code_Memory["DESCRIPTION"]="Sample Code Memory"
 Code_Memory["MODE"]="INTERN"
 Code_Memory["ORIGIN_ADDR"]="0x16000"
 Code_Memory["LENGTH"]="0x86C"
 Code_Memory["OFFSET_ADDR"]="-1 -1 -1 -1 -1"
 Code_Memory["COMMUNICATION_INTERFACE"]="XCP"
 Code_Memory["SEGMENT_VALUE"]="0x0 0x2 0x0 0x0 0x0"
 Code_Memory["PAGE1"]="0x0"
 Code_Memory["PAGE2"]="0x1"


 Raster=Hash.new
 for i in 1..5
  Raster_Details=Hash.new
  Raster_Details["PROCESS"]="Raster_Number_" + i.to_s
  Raster_Details["CSE_UNIT"]=(i+1).to_s
  Raster_Details["MINIMAL_PERIOD_NUMBER"]=(i+2).to_s
  Raster_Details["VERSION_NUMBER"]="0x010" + (i+3).to_s
  Raster_Details["HW_TRIGGER_NUMBER"]=(i+4).to_s
  Raster_Details["DIRECTION_MODE"]="DIRECT"
  Raster_Details["RASTER_PRIORITY"]=(i+15).to_s
  Raster_Details["MEASUREMENT_MODE"]="MEASUREMENT"
  Raster_Details["TRIGGER_ADDRESS"]="0xa0a00D10" + i.to_s
  Raster_Details["DISPLAY_MAX_SIZE"]="0x120" + i.to_s
  Raster_Details["DISPLAY_START_ADDRESS"]="0xa0a01200" + i.to_s
  Raster_Details["DISPLAY_OUTPUT_ADDRESS"]="0xa0a00200" + i.to_s
  Raster_Details["BYPASS_MAX_SIZE"]=(i-1).to_s
  Raster_Details["BYPASS_START_ADDRESS"]="0x0" + i.to_s
  Raster_Details["BYPASS_OUTPUT_ADDRESS"]="0x0" + i.to_s
  Raster_Details["WORST_CASE_RASTER_TIME"]=5000
  Raster_Details["MAX_READ_VARIABLES"]="0x7E" + i.to_s
  Raster_Details["MAX_WRITE_VARIABLES"]="0x0" + i.to_s
  Raster[i]=Raster_Details
 end

 Blob=Hash.new
 Blob["VERSION"]="0x1000102"
 Blob["INTERFACE_SPEED"]="INTERFACE_SPEED_8MBIT"
 Blob["RESET_CFG"]="0xFFFFFFFF"
 Blob["DISPLAY_TABLE_TYPE"]="0xD"
 Blob["DISPLAY_TABLE_DATATYPE"]="0x0122"
 Blob["BYTE_ORDER"]="0x2"
 Blob["TRIGGER_SEGMENT_ADDR"]="0xa0a00C00"
 Blob["TRIGGER_CONFIGURATION"]="0x01020200"
 Blob["TRG_MOD_ID"]="0x0"
 Blob["TRIG_MOD"]="0xFF 0x0 0x0"
 Blob["ETK_CONF"]="0x10 0x07 0x43 0x00 0x14 0xFF 0xFF"
 Blob["START_ADDR"]="0xa0a00000"
 Blob["LENGTH"]="0x003000"
 Blob["LOCATION"]="EXTERN"
 Blob["APPLICATION"]="MEASUREMENT"
 Blob["USAGE"]="CHECKSUM_EXCLUDE_ONLY"
 Blob["OFFSET_ADDR"]="-1 -1 -1 -1 -1"

Measurement_Identical=Hash.new

for i in 2..100
  Meas_Details=Hash.new
  Meas_Details["NAME"]="Measurement_Name_" + i.to_s
  Meas_Details["DESCRIPTION"]="This is a Sample Description for this Compu Method_" + i.to_s
  Meas_Details["DATATYPE"]="UBYTE"
  Meas_Details["COMPU_METHOD"]="I_DONT_KNOW"
  Meas_Details["RESOLUTION"]=(i-1).to_s
  Meas_Details["ACCURACY"]=(i-1).to_s
  Meas_Details["MIN_VALUE"]=(i-45).to_s
  Meas_Details["MAX_VALUE"]=(i+45).to_s
  Meas_Details["ECU_ADDR"]="0xD0015B52"
  Meas_Details["FORMAT"]="%5.0"
  Measurement_Identical[i]=Meas_Details
end


Measurement_BitMask=Hash.new

for i in 101..145
  Meas_Details=Hash.new
  Meas_Details["NAME"]="Measurement_Name_" + i.to_s
  Meas_Details["DESCRIPTION"]="This is a Sample Description for this Compu Method_" + i.to_s
  Meas_Details["DATATYPE"]="UBYTE"
  Meas_Details["COMPU_METHOD"]="I_DONT_KNOW"
  Meas_Details["RESOLUTION"]=(i-1).to_s
  Meas_Details["ACCURACY"]=(i-1).to_s
  Meas_Details["MIN_VALUE"]=(i-45).to_s
  Meas_Details["MAX_VALUE"]=(i+45).to_s
  Meas_Details["BITMASK_ADDR"]=(i+45).to_s
  Meas_Details["ECU_ADDR"]="0xD0015B52"
  Meas_Details["FORMAT"]="%5.0"
  Measurement_BitMask[i]=Meas_Details
end

Measurement_Array=Hash.new

for i in 251..300
  Meas_Details=Hash.new
  Meas_Details["NAME"]="Measurement_Name_" + i.to_s
  Meas_Details["DESCRIPTION"]="This is a Sample Description for this Compu Method_" + i.to_s
  Meas_Details["DATATYPE"]="UBYTE"
  Meas_Details["COMPU_METHOD"]="I_DONT_KNOW"
  Meas_Details["RESOLUTION"]=(i-1).to_s
  Meas_Details["ACCURACY"]=(i-1).to_s
  Meas_Details["MIN_VALUE"]=(i-45).to_s
  Meas_Details["MAX_VALUE"]=(i+45).to_s
  Meas_Details["ECU_ADDR"]="0xD0015B52"
  Meas_Details["FORMAT"]="%5.0"
  Meas_Details["ARRAY_SIZE"]=(i+15).to_s  
  Measurement_Array[i]=Meas_Details
end


Measurement_Matrix=Hash.new

for i in 251..300
  Meas_Details=Hash.new
  Meas_Details["NAME"]="Measurement_Name_" + i.to_s
  Meas_Details["DESCRIPTION"]="This is a Sample Description for this Compu Method_" + i.to_s
  Meas_Details["DATATYPE"]="UBYTE"
  Meas_Details["COMPU_METHOD"]="I_DONT_KNOW"
  Meas_Details["RESOLUTION"]=(i-1).to_s
  Meas_Details["ACCURACY"]=(i-1).to_s
  Meas_Details["MIN_VALUE"]=(i-45).to_s
  Meas_Details["MAX_VALUE"]=(i+45).to_s
  Meas_Details["ECU_ADDR"]="0xD0015B52"
  Meas_Details["FORMAT"]="%5.0"
  Meas_Details["MATRIX_SIZE"]=(i*6).to_s 
  Meas_Details["ROWS"]=(i*3).to_s
  Meas_Details["COLUMNS"]=(2).to_s
  Measurement_Matrix[i]=Meas_Details
end

Measurement_Virtual=Hash.new

for i in 251..300
  Meas_Details=Hash.new
  Meas_Details["NAME"]="Measurement_Name_" + i.to_s
  Meas_Details["DESCRIPTION"]="This is a Sample Description for this Compu Method_" + i.to_s
  Meas_Details["DATATYPE"]="UBYTE"
  Meas_Details["COMPU_METHOD"]="I_DONT_KNOW"
  Meas_Details["RESOLUTION"]=(i-1).to_s
  Meas_Details["ACCURACY"]=(i-1).to_s
  Meas_Details["MIN_VALUE"]=(i-45).to_s
  Meas_Details["MAX_VALUE"]=(i+45).to_s
  Meas_Details["ECU_ADDR"]="0xD0015B52"
  Meas_Details["FORMAT"]="%5.0"
  Meas_Details["VIRTUAL_VARIABLE"]="Measurement_Name_" + (i-6).to_s 
  Measurement_Virtual[i]=Meas_Details
end

Characteristic_Identical=Hash.new

for i in 555..570
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown"
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s
  Char_Details["EXTENDED_MINIMUM"]=(i-45).to_s
  Char_Details["EXTENDED_MAXIMUM"]=(i+45).to_s
  Char_Details["BITMASK"]="0xD0015B52"
  Char_Details["FORMAT"]="%5.0"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"
  Characteristic_Identical[i]=Char_Details
end

Characteristic_Array=Hash.new

for i in 555..570
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown"  
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s
  Char_Details["EXTENDED_MINIMUM"]=(i-45).to_s
  Char_Details["EXTENDED_MAXIMUM"]=(i+45).to_s
  Char_Details["BITMASK"]="0xD0015B52"
  Char_Details["MATRIX_SIZE"]=(i*6).to_s 
  Char_Details["ROWS"]=(i*3).to_s
  Char_Details["COLUMNS"]=(2).to_s
  Char_Details["FORMAT"]="%5.0"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"
  Characteristic_Array[i]=Char_Details
end

Characteristic_ASCII=Hash.new

for i in 555..570
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s
  Char_Details["NUMBER"]=(i-45).to_s
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"
  Characteristic_ASCII[i]=Char_Details
end

Characteristic_Curve_Standard=Hash.new

for i in 700..723
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"
  Characteristic_Curve_Standard[i]=Char_Details
end


Characteristic_Curve_Common=Hash.new

for i in 725..750
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["AXIS_PTS_REF_NAME"]="Test_Axis_Pt_Reference_Name_" + i.to_s  


  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  # Axis Point Reference Details
  Char_Details["AXIS_PT_DESCRIPTION"]="Test_Axis_Pt_Description_" + i.to_s  
  Char_Details["AXIS_PT_ADDRESS"]="0xA00424D0" + i.to_s 
  Char_Details["AXIS_PT_INPUT"]="Test_Axis_Pt_Input_" + i.to_s  
  Char_Details["AXIS_PT_LAYOUT"]="Test_Axis_Pt_Layout_" + i.to_s    
  Char_Details["AXIS_PT_COMPU"]="Test_Axis_Pt_Compu_" + i.to_s   
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_PT_MINIMUM"]=(i-55).to_s  
  Char_Details["AXIS_PT_MAXIMUM"]=(i+55).to_s 
  Char_Details["AXIS_PT_DISPLAY_IDENTIFIER"]="I DONT KNOW THE AXIS POINT IDENTIFIER"

  Characteristic_Curve_Common[i]=Char_Details
end

Characteristic_Curve_Fix_Axis=Hash.new

for i in 725..750
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["FIX_AXIS_1"]="Test_Axis_Fix_Axis_Name_" + i.to_s  
  Char_Details["FIX_AXIS_2"]="Test_Axis_Fix_Axis_Name_" + i.to_s  
  Char_Details["FIX_AXIS_3"]="Test_Axis_Fix_Axis_Name_" + i.to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Curve_Fix_Axis[i]=Char_Details
end

Characteristic_Curve_Fix_Axis_List=Hash.new

for i in 725..750
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["FIX_AXIS_1"]="Test_Axis_Fix_Axis_Name_1_" + i.to_s  
  Char_Details["FIX_AXIS_2"]="Test_Axis_Fix_Axis_Name_2_" + i.to_s  
  Char_Details["FIX_AXIS_3"]="Test_Axis_Fix_Axis_Name_3_" + i.to_s  
  Char_Details["FIX_AXIS_4"]="Test_Axis_Fix_Axis_Name_4_" + i.to_s  
  Char_Details["FIX_AXIS_5"]="Test_Axis_Fix_Axis_Name_5_" + i.to_s  
  Char_Details["FIX_AXIS_6"]="Test_Axis_Fix_Axis_Name_6_" + i.to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Curve_Fix_Axis_List[i]=Char_Details
end

Characteristic_Curve_Axis=Hash.new

for i in 725..750
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["CURVE_AXIS_REFERENCE_NAME"]="Test_Curve_Axis_Reference_Name_" + i.to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Curve_Axis[i]=Char_Details
end

Characteristic_Curve_Axis_Standard=Hash.new

for i in 765..800
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Curve_Axis_Standard[i]=Char_Details
end

Characteristic_Curve_Axis_Rescale=Hash.new

for i in 825..875
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_RESCALE_PAIRS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["AXIS_PTS_REF_NAME"]="Test_Axis_Pt_Reference_Name_" + i.to_s  


  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  # Axis Point Reference Details
  Char_Details["AXIS_PT_DESCRIPTION"]="Test_Axis_Pt_Description_" + i.to_s  
  Char_Details["AXIS_PT_ADDRESS"]="0xA00424D0" + i.to_s 
  Char_Details["AXIS_PT_NAME"]="0xA00424D0" + i.to_s 
  Char_Details["AXIS_PT_INPUT"]="Test_Axis_Pt_Input_" + i.to_s    
  Char_Details["AXIS_PT_COMPU"]="Test_Axis_Pt_Compu_" + i.to_s   
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_PT_MINIMUM"]=(i-55).to_s  
  Char_Details["AXIS_PT_MAXIMUM"]=(i+55).to_s 
  Char_Details["AXIS_PT_DISPLAY_IDENTIFIER"]="I DONT KNOW THE AXIS POINT IDENTIFIER"


  Characteristic_Curve_Axis_Rescale[i]=Char_Details
end

Characteristic_Curve_Monotony=Hash.new

for i in 825..875
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s
  if i%2==0
    Char_Details["MONOTONY"]="STRICT_DECREASE"
    else
    Char_Details["MONOTONY"]="STRICT_INCREASE"        
  end  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Curve_Monotony[i]=Char_Details
end


Characteristic_Map_Standard=Hash.new

for i in 876..900
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis 1 Details
  Char_Details["AXIS_1_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_1_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_1_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_1_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_1_MAXIMUM"]=(i+45).to_s

  Char_Details["AXIS_2_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_2_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_2_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_2_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_2_MAXIMUM"]=(i+45).to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Map_Standard[i]=Char_Details
end

Characteristic_Cuboid_Standard=Hash.new

for i in 901..925
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis 1 Details
  Char_Details["AXIS_1_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_1_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_1_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_1_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_1_MAXIMUM"]=(i+45).to_s

  Char_Details["AXIS_2_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_2_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_2_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_2_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_2_MAXIMUM"]=(i+45).to_s  

  Char_Details["AXIS_3_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_3_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_3_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_3_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_3_MAXIMUM"]=(i+45).to_s  

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Cuboid_Standard[i]=Char_Details
end


Characteristic_Dependent_Or_Virtual=Hash.new

for i in 926..950
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis 1 Details
  if i%2==0
    Char_Details["TYPE"]="DEPENDENT"
    else
    Char_Details["TYPE"]="VIRTUAL"        
  end  

  Char_Details["VARIABLE_1"]="Test_Axis_1_" + i.to_s  
  Char_Details["OPERATOR"]="+"
  Char_Details["VARIABLE_2"]="Test_Axis_2_" + i.to_s 
  Char_Details["VARIABLE_1_REF"]="Test_Axis_1_Ref_" + i.to_s    
  Char_Details["VARIABLE_2_REF"]="Test_Axis_2_Ref_" + i.to_s 

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Dependent_Or_Virtual[i]=Char_Details
end

Characteristic_Curve=Hash.new

for i in 951..975
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["DEFAULT_VALUE"]=i.to_s
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis Details
  Char_Details["AXIS_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_MAXIMUM"]=(i+45).to_s  
  Char_Details["AXIS_PTS_REF_NAME"]="Test_Axis_Pt_Reference_Name_" + i.to_s  

  Characteristic_Curve[i]=Char_Details
end

Characteristic_Map=Hash.new

for i in 976..1000
  Char_Details=Hash.new
  Char_Details["ECU_VARIABLE"]="Characteristic_Name_" + i.to_s
  Char_Details["DESCRIPTION"]="This is a Sample Description for this Characterisic_" + i.to_s
  Char_Details["ECU_ADDRESS"]="0xD0015B52" + i.to_s
  Char_Details["RECORD_LAYOUT"]="God Knows"
  Char_Details["DEFAULT_VALUE"]=i.to_s
  Char_Details["COMPU_METHOD"]="Unknown" 
  Char_Details["MINIMUM"]=(i-10).to_s
  Char_Details["MAXIMUM"]=(i+10).to_s

  # Axis 1 Details
  Char_Details["AXIS_1_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_1_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_1_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_1_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_1_MAXIMUM"]=(i+45).to_s
  Char_Details["AXIS_PTS_1_REF_NAME"]="Test_Axis_Pt_1_Reference_Name_" + i.to_s


  Char_Details["AXIS_2_NAME"]="Test_Axis_" + i.to_s  
  Char_Details["AXIS_2_COMPU_METHOD"]="Test_Axis_Compu_Method_" + i.to_s 
  Char_Details["AXIS_2_NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_2_MINIMUM"]=(i-45).to_s    
  Char_Details["AXIS_2_MAXIMUM"]=(i+45).to_s  
  Char_Details["AXIS_PTS_2_REF_NAME"]="Test_Axis_Pt_2_Reference_Name_" + i.to_s

  Char_Details["FORMAT"]="%5.6"
  Char_Details["DISPLAY_IDENTIFIER"]="I DONT KNOW"

  Characteristic_Map[i]=Char_Details
end


Axis_Pts = Hash.new

for i in 1001..1025
  Char_Details["AXIS_PTS_REF_NAME"]="Test_Axis_Pt_Reference_Name_" + i.to_s
  Char_Details["AXIS_PT_DESCRIPTION"]="Test_Axis_Pt_Description_" + i.to_s  
  Char_Details["AXIS_PT_ADDRESS"]="0xA00424D0" + i.to_s 
  Char_Details["AXIS_PT_INPUT"]="Test_Axis_Pt_Input_" + i.to_s
  Char_Details["AXIS_PT_LAYOUT"]="Test_Axis_Pt_Layout_" + i.to_s      
  Char_Details["AXIS_PT_DEFAULT_VALUE"]=i.to_s 
  Char_Details["AXIS_PT_COMPU"]="Test_Axis_Pt_Compu_" + i.to_s   
  Char_Details["NUMBER_OF_AXIS_PTS"]=(i+10).to_s
  Char_Details["AXIS_PT_MINIMUM"]=(i-55).to_s  
  Char_Details["AXIS_PT_MAXIMUM"]=(i+55).to_s 
  Axis_Pts[i]=Char_Details
end

A2L.Generate