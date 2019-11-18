<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
    <!-- iWlz 2.1 CD017 version 1.9.7 (2019-10-01) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD017"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD017"/>
    </xsl:template>

    <xsl:template match="aw33:Relatie" mode="CD017">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="aw33:Soort"/>
            <xsl:with-param name="pValue1">12</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Geboortedatum/iwlz:Datum"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD017</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Relatie" mode="CD017">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk31:Soort"/>
            <xsl:with-param name="pValue1">12</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Geboortedatum/iwlz:Datum"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD017</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Relatie" mode="CD017">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk33:Soort"/>
            <xsl:with-param name="pValue1">12</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Geboortedatum/iwlz:Datum"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD017</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Relatie" mode="CD017">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="io31:Soort"/>
            <xsl:with-param name="pValue1">12</xsl:with-param>
            <xsl:with-param name="pOther" select="io31:Geboortedatum/iwlz:Datum"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD017</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
