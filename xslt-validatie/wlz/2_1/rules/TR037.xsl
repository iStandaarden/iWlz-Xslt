<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR037 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR037"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR037"/>
    </xsl:template>

    <xsl:template match="aw33:Indicatie" mode="TR037">
        <xsl:call-template name="tr037"/>
    </xsl:template>

    <xsl:template match="zk31:Indicatie" mode="TR037">
        <xsl:call-template name="tr037"/>
    </xsl:template>
    
    <xsl:template match="zk33:Indicatie" mode="TR037">
        <xsl:call-template name="tr037"/>
    </xsl:template>

    <xsl:template name="tr037">
        <xsl:param name="pIndicatie" select="."/>

        <xsl:if test="count(./*/*[local-name() = 'GeindiceerdeFunctie' or local-name() = 'GeindiceerdZorgzwaartepakket']) = 0">
            <xsl:call-template name="addError">
                <xsl:with-param name="pElements" select="$pIndicatie"/>
                <xsl:with-param name="pRule">
                    TR037
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
