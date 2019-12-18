<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR057 version 1.9.16 (2019-12-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR057"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR057"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdZorgzwaartepakket" mode="TR057">
        <xsl:call-template name="tr057"/>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdZorgzwaartepakket" mode="TR057">
        <xsl:call-template name="tr057"/>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdZorgzwaartepakket" mode="TR057">
        <xsl:call-template name="tr057"/>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdZorgzwaartepakket" mode="TR057">
        <xsl:call-template name="tr057"/>
    </xsl:template>

    <xsl:template name="tr057">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pList" select="preceding-sibling::*"/>

        <xsl:for-each select="$pList">
            <xsl:variable name="isOverlay">
                <xsl:call-template name="isPeriodOverlay">
                    <xsl:with-param name="pThis" select="$pThis"/>
                    <xsl:with-param name="pOther" select="current()"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:if test="$isOverlay = 'true'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="$pThis |current()"/>
                    <xsl:with-param name="pRule">
                        TR057
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
