<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>

    <!-- iWlz 2.1 CD073 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD073"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD073"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="aw33:Dossierhouder"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="aw39:Dossierhouder"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca317:GeleverdeZorg" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="ca317:Instelling"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="zk31:Dossierhouder"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="zk33:Dossierhouder"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CD073">
        <xsl:call-template name="cd073">
            <xsl:with-param name="pLeveringsvorm" select="*[local-name()='Leveringsvorm']"/>
            <xsl:with-param name="pOther" select="zk39:Dossierhouder"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="cd073">
        <xsl:param name="pLeveringsvorm"/>
        <xsl:param name="pOther"/>

        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="$pLeveringsvorm"/>
            <xsl:with-param name="pValue1">4,5,8</xsl:with-param>
            <xsl:with-param name="pOther" select="$pOther"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">
                CD073
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
