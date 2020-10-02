<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
>
    <!-- iWlz 2.2 TR034 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR034"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR034"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="aw33:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="aw33:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw35:GeleverdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="aw35:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="aw35:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="io31:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="io31:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk31:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk31:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk33:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk33:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdeFunctie" mode="TR034">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="zk35:FunctieCode"/>
            <xsl:with-param name="pValue1">71</xsl:with-param>
            <xsl:with-param name="pOther" select="zk35:Opslag"/>
            <xsl:with-param name="pValue2"/>
            <xsl:with-param name="pRule">TR034</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
