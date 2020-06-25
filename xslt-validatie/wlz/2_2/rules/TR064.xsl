<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
    <!-- iwlz 2.1 TR064 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR064"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR064"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdeFunctie/aw35:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw35:Bericht/aw35:Header/aw35:Afzender"/>
            <xsl:with-param name="pLocal" select="true()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw35:Bericht/aw35:Header/aw35:Afzender"/>
            <xsl:with-param name="pLocal" select="true()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:MutatieFunctie/aw39:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw39:Bericht/aw39:Header/aw39:Afzender"/>
            <xsl:with-param name="pLocal" select="true()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw39:MutatieZorgzwaartepakket/aw39:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::aw39:Bericht/aw39:Header/aw39:Afzender"/>
            <xsl:with-param name="pLocal" select="true()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdeFunctie/zk35:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::zk35:Bericht/zk35:Header/zk35:Afzender"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::zk35:Bericht/zk35:Header/zk35:Afzender"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:MutatieFunctie/zk39:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::zk39:Bericht/zk39:Header/zk39:Afzender"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk39:MutatieZorgzwaartepakket/zk39:Instelling" mode="TR064">
        <xsl:call-template name="checkzorgkantoor">
            <xsl:with-param name="pOther" select="ancestor-or-self::zk39:Bericht/zk39:Header/zk39:Afzender"/>
            <xsl:with-param name="pLocal" select="false()" />
            <xsl:with-param name="pRule">TR064</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>