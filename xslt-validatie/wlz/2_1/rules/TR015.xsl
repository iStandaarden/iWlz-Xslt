<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR015 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR015"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR015"/>
    </xsl:template>

    <xsl:template match="aw33:Indicatie" mode="TR015">
        <xsl:variable name="minDate">
            <xsl:call-template name="minDate">
                <xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Ingangsdatum"/>
                <xsl:with-param name="pAccumulator">9999-99-99</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="checkDateEquals">
            <xsl:with-param name="pThis" select="aw33:Ingangsdatum"/>
            <xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/aw33:Ingangsdatum[text() = $minDate]"/>
            <xsl:with-param name="pRule">TR015</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Indicatie" mode="TR015">
        <xsl:variable name="minDate">
            <xsl:call-template name="minDate">
                <xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Ingangsdatum"/>
                <xsl:with-param name="pAccumulator">9999-99-99</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="checkDateEquals">
            <xsl:with-param name="pThis" select="io31:Ingangsdatum"/>
            <xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/io31:Ingangsdatum[text() = $minDate]"/>
            <xsl:with-param name="pRule">TR015</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Indicatie" mode="TR015">
        <xsl:variable name="minDate">
            <xsl:call-template name="minDate">
                <xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Ingangsdatum"/>
                <xsl:with-param name="pAccumulator">9999-99-99</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="checkDateEquals">
            <xsl:with-param name="pThis" select="zk31:Ingangsdatum"/>
            <xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk31:Ingangsdatum[text() = $minDate]"/>
            <xsl:with-param name="pRule">TR015</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Indicatie" mode="TR015">
        <xsl:variable name="minDate">
            <xsl:call-template name="minDate">
                <xsl:with-param name="pList" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Ingangsdatum"/>
                <xsl:with-param name="pAccumulator">9999-99-99</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="checkDateEquals">
            <xsl:with-param name="pThis" select="zk33:Ingangsdatum"/>
            <xsl:with-param name="pOther" select="*[local-name() = 'GeindiceerdeZorgzwaartepakketten' or local-name() = 'GeindiceerdeFuncties']/*/zk33:Ingangsdatum[text() = $minDate]"/>
            <xsl:with-param name="pRule">TR015</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
