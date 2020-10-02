<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
>
    <!-- iWlz 2.2 TR100 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR100"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR100"/>
    </xsl:template>

    <xsl:template match="aw35:Header/aw35:Afzender" mode="TR100">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw35:Header/aw35:Ontvanger"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR100</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:Header/aw39:Afzender" mode="TR100">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw39:Header/aw39:Ontvanger"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR100</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>