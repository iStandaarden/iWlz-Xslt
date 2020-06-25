<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema">

    <!-- iWlz 2.1 CS072 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS072"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS072"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie/aw33:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:AanvraagInstelling/aw39:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket/aw317:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie/zk31:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie/zk33:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:AanvraagInstelling/zk39:Soort" mode="CS072">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">5</xsl:with-param>
            <xsl:with-param name="pRule">CS072</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
