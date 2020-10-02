<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
>
    <!-- iWlz 2.2 CS012 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS012"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS012"/>
    </xsl:template>
    
    <xsl:template match="aw317:Stoornis" mode="CS012">
    	<xsl:call-template name="cs012"/>
    </xsl:template>
    
    <xsl:template match="aw33:Stoornis" mode="CS012">
    	<xsl:call-template name="cs012"/>
    </xsl:template>
    
    <xsl:template match="zk31:Stoornis" mode="CS012">
    	<xsl:call-template name="cs012"/>
    </xsl:template>
    
    <xsl:template match="zk33:Stoornis" mode="CS012">
    	<xsl:call-template name="cs012"/>
    </xsl:template>
    
    <xsl:template match="io31:Stoornis" mode="CS012">
    	<xsl:call-template name="cs012"/>
    </xsl:template>
    
    <xsl:template name="cs012">
    	<xsl:param name="pThis" select="."/>
    	
    	<!-- COD923 -->
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">014,019</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
            <xsl:with-param name="pValue2">01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21</xsl:with-param>
            <xsl:with-param name="pRule">CS012</xsl:with-param>
        </xsl:call-template>
        <!-- COD925 -->
        <xsl:if test="*[local-name()='DiagnoseCodelijst'] = '021'">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseSubcodelijst']"/>
	            <xsl:with-param name="pValue1">01</xsl:with-param>
	            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
	            <xsl:with-param name="pValue2">b110,b114,b117,b122,b126,b130,b134,b139,b140,b144,b147,b152,b156,b160,b164,b199</xsl:with-param>
	            <xsl:with-param name="pRule">CS012</xsl:with-param>
	        </xsl:call-template>
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseSubcodelijst']"/>
	            <xsl:with-param name="pValue1">02</xsl:with-param>
	            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
	            <xsl:with-param name="pValue2">b210,b215,b220,b229,b230,b235,b270</xsl:with-param>
	            <xsl:with-param name="pRule">CS012</xsl:with-param>
	        </xsl:call-template>
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseSubcodelijst']"/>
	            <xsl:with-param name="pValue1">03</xsl:with-param>
	            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
	            <xsl:with-param name="pValue2">b310,b320,b340,b410,b415,b420,b430,b435,b440,b455,b469,b510,b515,b525,b535,b539,b540,b545,b550,b555,b559,b610,b620,b639,b679,b710,b715,b729,b749,b750,b755,b760,b765,b789,b849,b869</xsl:with-param>
	            <xsl:with-param name="pRule">CS012</xsl:with-param>
	        </xsl:call-template>
        </xsl:if>
        <!-- COD924 -->
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">022</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
            <xsl:with-param name="pValue2">b117.0,b117.1,b117.2,b117.3,b117.4,b117.9</xsl:with-param>
            <xsl:with-param name="pRule">CS012</xsl:with-param>
        </xsl:call-template>
        <!-- COD926 -->
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">023</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
            <xsl:with-param name="pValue2">b210.1,b210.2,b210.3,b210.4,b210.9</xsl:with-param>
            <xsl:with-param name="pRule">CS012</xsl:with-param>
        </xsl:call-template>
        <!-- COD927 -->
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">024</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='ZiektebeeldStoornis']"/>
            <xsl:with-param name="pValue2">b230.1,b230.2,b230.3,b230.4,b230.9</xsl:with-param>
            <xsl:with-param name="pRule">CS012</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
