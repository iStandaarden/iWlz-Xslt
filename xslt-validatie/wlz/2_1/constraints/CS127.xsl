<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"

>
    <!-- iWlz 2.1 CS127 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS127"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS127"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template match="zk35:GeleverdZorgzwaartepakket" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CS127">
        <xsl:call-template name="cs127"/>
    </xsl:template>

    <xsl:template name="cs127">
        <xsl:param name="pLeveringsvorm" select="./*[local-name() = 'Leveringsvorm']"/>
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pThis" select="$pLeveringsvorm"/>
            <xsl:with-param name="pValues">!2</xsl:with-param>
            <xsl:with-param name="pRule">CS127</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
