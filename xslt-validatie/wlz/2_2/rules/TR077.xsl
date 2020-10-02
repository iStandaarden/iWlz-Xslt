<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
>
    <!-- iWlz 2.2 TR077 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR077"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR077"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie" mode="TR077">
        <xsl:call-template name="tr077"/>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie" mode="TR077">
        <xsl:call-template name="tr077"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie" mode="TR077">
        <xsl:call-template name="tr077"/>
    </xsl:template>

    <xsl:template name="tr077">
        <xsl:param name="pToegewezenFunctie" select="."/>
        <xsl:param name="pList" select="preceding-sibling::*"/>

        <xsl:for-each select="$pList">
            <xsl:if test="$pToegewezenFunctie/*[local-name() = 'FunctieCode'] = current()/*[local-name() = 'FunctieCode'] and
                          $pToegewezenFunctie/*[local-name() = 'Soort'] = current()/*[local-name() = 'Soort']">

                <xsl:variable name="isOverlay">
                    <xsl:call-template name="isPeriodOverlay">
                        <xsl:with-param name="pThis" select="$pToegewezenFunctie"/>
                        <xsl:with-param name="pOther" select="current()"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="isOneDayOverlay">
                    <xsl:call-template name="isOneDayPeriodOverlay">
                        <xsl:with-param name="pThis" select="$pToegewezenFunctie"/>
                        <xsl:with-param name="pOther" select="current()"/>
                    </xsl:call-template>
                </xsl:variable>
				
                <xsl:if test="$isOverlay = 'true' and $isOneDayOverlay = 'false'">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="$pToegewezenFunctie | current()"/>
                        <xsl:with-param name="pRule">
                            TR077
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
