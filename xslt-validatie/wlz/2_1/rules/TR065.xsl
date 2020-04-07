<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR065 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR065"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR065"/>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie/zk31:Zorgkantoor" mode="TR065">
        <xsl:call-template name="TR065"/>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Zorgkantoor" mode="TR065">
        <xsl:call-template name="TR065"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie/zk33:Zorgkantoor" mode="TR065">
        <xsl:call-template name="TR065"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:Zorgkantoor" mode="TR065">
        <xsl:call-template name="TR065"/>
    </xsl:template>

    <xsl:template name="TR065">
        <xsl:param name="pZorgkantoor" select="."/>
        <xsl:param name="pAfzender"
                   select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'Afzender']"/>

            <xsl:call-template name="checkvalue">
                <xsl:with-param name="pThis" select="$pZorgkantoor"/>
                <xsl:with-param name="pValues" select="$pAfzender"/>
                <xsl:with-param name="pRule">
                    TR065
                </xsl:with-param>
            </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
