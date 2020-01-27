<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>

    <!-- iWlz 2.1 CD074 version 1.9.18 (2020-01-24) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD074"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD074"/>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CD074">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7,8</xsl:with-param>
            <xsl:with-param name="pOther" select="aw39:Verantwoord" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD074</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7,8</xsl:with-param>
            <xsl:with-param name="pOther" select="aw39:Doelmatig" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD074</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CD074">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7,8</xsl:with-param>
            <xsl:with-param name="pOther" select="zk39:Verantwoord" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD074</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk39:Leveringsvorm"/>
            <xsl:with-param name="pValue1">7,8</xsl:with-param>
            <xsl:with-param name="pOther" select="zk39:Doelmatig" />
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD074</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
