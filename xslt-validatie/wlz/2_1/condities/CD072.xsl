<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
                >
    <!-- iWlz 2.1 CD072 version 1.8.5 (2019-08-28) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD072"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD072"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca317:GeleverdeZorg" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdZorgzwaartepakket" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CD072">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="*[local-name() = 'Leveringsvorm']"/>
            <xsl:with-param name="pValue1">8</xsl:with-param>
            <xsl:with-param name="pOther" select="*[local-name() = 'Etmalen']"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>