<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 CS014 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS014"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS014"/>
    </xsl:template>
    
    <xsl:template match="aw317:Stoornis" mode="CS014">
    	<xsl:call-template name="cs014"/>
    </xsl:template>
    
    <xsl:template match="aw33:Stoornis" mode="CS014">
    	<xsl:call-template name="cs014"/>
    </xsl:template>
    
    <xsl:template match="zk31:Stoornis" mode="CS014">
    	<xsl:call-template name="cs014"/>
    </xsl:template>
    
    <xsl:template match="zk33:Stoornis" mode="CS014">
    	<xsl:call-template name="cs014"/>
    </xsl:template>
    
    <xsl:template match="io31:Stoornis" mode="CS014">
    	<xsl:call-template name="cs014"/>
    </xsl:template>
    
    <xsl:template name="cs014">
    	<xsl:param name="pThis" select="."/>
    	
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">014</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='DiagnoseSubcodelijst']"/>
            <xsl:with-param name="pValue2">04,05,06</xsl:with-param>
            <xsl:with-param name="pRule">
                CS014
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">019</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='DiagnoseSubcodelijst']"/>
            <xsl:with-param name="pValue2">07,08,09,10,11</xsl:with-param>
            <xsl:with-param name="pRule">
                CS014
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">021</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='DiagnoseSubcodelijst']"/>
            <xsl:with-param name="pValue2">01,02,03</xsl:with-param>
            <xsl:with-param name="pRule">
                CS014
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">023</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='DiagnoseSubcodelijst']"/>
            <xsl:with-param name="pValue2">12</xsl:with-param>
            <xsl:with-param name="pRule">
                CS014
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="*[local-name()='DiagnoseCodelijst']"/>
            <xsl:with-param name="pValue1">024</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name()='DiagnoseSubcodelijst']"/>
            <xsl:with-param name="pValue2">13</xsl:with-param>
            <xsl:with-param name="pRule">
                CS014
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
