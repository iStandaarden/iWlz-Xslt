<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>

    <!-- iWlz 2.1 CD052 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD052"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD052"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="CD052">
        <xsl:call-template name="cd052"/>
  </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket" mode="CD052">
        <xsl:call-template name="cd052"/>
    </xsl:template>

    <xsl:template match="aw39:Aanvraag" mode="CD052">
        <xsl:call-template name="cd052">
            <xsl:with-param name="pOpname" select="aw39:AanvraagInstellingen/aw39:AanvraagInstelling/aw39:Opname"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="CD052">
        <xsl:call-template name="cd052"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="CD052">
        <xsl:call-template name="cd052"/>
    </xsl:template>

    <xsl:template match="zk39:Aanvraag" mode="CD052">
        <xsl:call-template name="cd052">
            <xsl:with-param name="pOpname" select="zk39:AanvraagInstellingen/zk39:AanvraagInstelling/zk39:Opname"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="cd052">
        <xsl:param name="pOpname" select="./*[local-name() = 'Opname']"/>
        <xsl:param name="pLeveringsvorm" select="./*[local-name() = 'Leveringsvorm']"/>

        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="$pLeveringsvorm"/>
            <xsl:with-param name="pValue1">4,8</xsl:with-param>
            <xsl:with-param name="pOther" select="$pOpname"/>
            <xsl:with-param name="pValue2">*</xsl:with-param>
            <xsl:with-param name="pRule">CD052</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
