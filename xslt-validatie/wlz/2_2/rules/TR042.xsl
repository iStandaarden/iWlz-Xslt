<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_2/ca317/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
    <!-- iWlz 2.2 TR042 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR042"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR042"/>
    </xsl:template>
    
    <xsl:template match="aw33:ToegewezenFunctie/aw33:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw33:ToegewezenFunctie/aw33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::aw33:ToegewezenFunctie/aw33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket/aw33:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket/aw33:CoordinatorZorgThuis" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket/aw33:Dossierhouder" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::aw33:ToegewezenZorgzwaartepakket/aw33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="aw35:GeleverdeFunctie/aw35:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw35:GeleverdeFunctis/aw35:Begindatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw35:GeleverdZorgzwaartepakket/aw35:Begindatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="aw39:Aanvraag/aw39:Dossierhouder" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:Bericht/aw39:Header/aw39:BerichtIdentificatie/iwlz:Dagtekening" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:Aanvraag/aw39:CoordinatorZorgThuis" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:Bericht/aw39:Header/aw39:BerichtIdentificatie/iwlz:Dagtekening" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:Aanvraag/aw39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:Aanvraag/aw39:Afgiftedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:AanvraagInstelling/aw39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:AanvraagInstelling/aw39:ToewijzingIngangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:MutatieFunctie/aw39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:MutatieFunctie/aw39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:MutatieFunctie/aw39:InstellingBestemming" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:MutatieFunctie/aw39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:MutatieZorgzwaartepakket/aw39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:MutatieZorgzwaartepakket/aw39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="aw39:MutatieZorgzwaartepakket/aw39:InstellingBestemming" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::aw39:MutatieZorgzwaartepakket/aw39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    
    <xsl:template match="ca317:GeleverdeZorg/ca317:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::ca317:GeleverdeZorg/ca317:Startdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="io31:GeindiceerdeFunctie/io31:InstellingVoorkeur" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::io31:GeindiceerdeFunctie/io31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="io31:GeindiceerdZorgzwaartepakket/io31:InstellingVoorkeur" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::io31:GeindiceerdZorgzwaartepakket/io31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie/zk31:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk31:ToegewezenFunctie/zk31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk31:ToegewezenZorgzwaartepakket/zk31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:CoordinatorZorgThuis" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk31:ToegewezenZorgzwaartepakket/zk31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Dossierhouder" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk31:ToegewezenZorgzwaartepakket/zk31:Ingangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk33:ToegewezenFunctie/zk33:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk33:ToegewezenFunctie/zk33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::zk33:ToegewezenFunctie/zk33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:CoordinatorZorgThuis" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:Dossierhouder" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Ingangsdatum" />
        	<xsl:with-param name="pTo" select="ancestor-or-self::zk33:ToegewezenZorgzwaartepakket/zk33:Einddatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk35:GeleverdeFunctie/zk35:Instelling" mode="TR042">
		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk35:GeleverdeFunctis/zk35:Begindatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk35:GeleverdZorgzwaartepakket/zk35:Begindatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk39:Aanvraag/zk39:Dossierhouder" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:Bericht/zk39:Header/zk39:BerichtIdentificatie/iwlz:Dagtekening" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:Aanvraag/zk39:CoordinatorZorgThuis" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:Bericht/zk39:Header/zk39:BerichtIdentificatie/iwlz:Dagtekening" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:Aanvraag/zk39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:Aanvraag/zk39:Afgiftedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:AanvraagInstelling/zk39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:AanvraagInstelling/zk39:ToewijzingIngangsdatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:MutatieFunctie/zk39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:MutatieFunctie/zk39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:MutatieFunctie/zk39:InstellingBestemming" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:MutatieFunctie/zk39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:MutatieZorgzwaartepakket/zk39:Instelling" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:MutatieZorgzwaartepakket/zk39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
    <xsl:template match="zk39:MutatieZorgzwaartepakket/zk39:InstellingBestemming" mode="TR042">
   		<xsl:call-template name="checkAGBValid">
        	<xsl:with-param name="pFrom" select="ancestor-or-self::zk39:MutatieZorgzwaartepakket/zk39:Mutatiedatum" />
        	<xsl:with-param name="pRule">TR042</xsl:with-param>
    	</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
