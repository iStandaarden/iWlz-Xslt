<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema">

    <!-- iWlz 2.1 CS088 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS088"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS088"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Sleuteldatum" mode="CS088">
        <xsl:call-template name="checkafterstrict">
            <xsl:with-param name="pThis" select="../aw35:Begindatum"/>
            <xsl:with-param name="pRule">
                CS088
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Sleuteldatum" mode="CS088">
        <xsl:call-template name="checkafterstrict">
            <xsl:with-param name="pThis" select="../zk35:Begindatum"/>
            <xsl:with-param name="pRule">
                CS088
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
