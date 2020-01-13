<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema">

    <!-- iWlz 2.1 CS062 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS062"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS062"/>
    </xsl:template>

    <xsl:template match="aw35:GeleverdZorgzwaartepakket/aw35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,3,4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="aw35:GeleverdeFunctie/aw35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,3,4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdZorgzwaartepakket/zk35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,3,4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk35:GeleverdeFunctie/zk35:Leveringsstatus" mode="CS062">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,3,4</xsl:with-param>
            <xsl:with-param name="pRule">CS062</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
