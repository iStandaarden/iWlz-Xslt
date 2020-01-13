<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:r="http://www.istandaarden.nl/validatie/1_1/rapport/schema"

>
    <xsl:output method="xml" version="1.0" encoding="UTF-8"
                indent="yes"/>


    <!-- Emit the (absolute or relative to the given context) XPath expression
        for this node; uses indexing when needed context is not checked currently -->
    <xsl:template name="printXPath">
        <xsl:param name="pElement" select="."/>
        <!-- Call recursive unless root; we have to use this way of detecting root
            for Java -->
        <xsl:if test="$pElement/ancestor::*"><!---->
            <xsl:call-template name="printXPath">
                <xsl:with-param name="pElement" select="$pElement/.."/>
            </xsl:call-template>
            <xsl:text>/</xsl:text>
        </xsl:if><!-- Print self -->
        <xsl:value-of select="local-name($pElement)"/><!-- Print
			child selector if applicable -->
        <xsl:if
                test="($pElement/preceding-sibling::*|$pElement/following-sibling::*)[local-name()=local-name($pElement)]">
            <xsl:value-of
                    select="concat('[',count($pElement/preceding-sibling::*[local-name()=local-name($pElement)])+1,']')"/>
        </xsl:if>
    </xsl:template>

    <!-- Evaluate an XPath expression relative to the given context; note: only
        supports node selectors and indexing, and the expression must start with
        a / -->
    <xsl:template name="evaluateXPath">
        <xsl:param name="pPath" select="."/>
        <xsl:param name="pContext" select="/"/>

        <xsl:choose>
            <xsl:when test="string-length($pPath) > 0">
                <!-- Strip leading / -->
                <xsl:variable name="vPath" select="substring($pPath,2)"/>
                <!-- Extract first node selector -->
                <xsl:variable name="vNodeTest">
                    <xsl:choose>
                        <xsl:when test="not(contains($vPath, '/'))">
                            <xsl:value-of select="$vPath"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring-before($vPath, '/')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <!-- Extract node position -->
                <xsl:variable name="vPosition">
                    <xsl:choose>
                        <xsl:when test="not(contains($vNodeTest, '['))">
                            1
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                    select="substring-after(substring-before($vNodeTest, ']'), '[')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <!-- Extract just the node name without position -->
                <xsl:variable name="vNameTest">
                    <xsl:choose>
                        <xsl:when test="not(contains($vNodeTest, '['))">
                            <xsl:value-of select="$vNodeTest"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                    select="substring-before($vNodeTest, '[')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <!-- Call recursively -->
                <xsl:call-template name="evaluateXPath">
                    <xsl:with-param name="pPath"
                                    select="substring-after($pPath, $vNodeTest)"/>
                    <xsl:with-param name="pContext"
                                    select="$pContext/*[local-name() = $vNameTest and count(preceding-sibling::*[local-name() = $vNameTest]) = $vPosition - 1]"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <!-- Just print the node contents if we are done -->
                <xsl:value-of
                        select="normalize-space($pContext/text())"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Add an error element for violating pRule at pElements -->
    <xsl:template name="addError">
        <xsl:param name="pRule">
            FOUT
        </xsl:param>
        <xsl:param name="pElements" select="."/>
        <xsl:param name="pCode" select="nonExistingNode"/>
        <xsl:param name="pDetails" select="''"/>
        <r:Fout>
            <r:Code>
                <xsl:value-of select="normalize-space($pRule)"/>
            </r:Code>
            <xsl:if test="$pCode">
                <r:Retourcode>
                    <xsl:value-of select="$pCode"/>
                </r:Retourcode>
            </xsl:if>
            <xsl:for-each select="$pElements">
                <r:Locatie>
                    <xsl:text>/</xsl:text>
                    <xsl:call-template name="printXPath">
                        <xsl:with-param name="pElement" select="."></xsl:with-param>
                    </xsl:call-template>
                </r:Locatie>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="$pDetails != ''">
                    <r:Details>
                        <xsl:value-of select="$pDetails"/>
                    </r:Details>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="translatedDetails">
                        <xsl:apply-templates select="."
                                             mode="getDetails">
                            <xsl:with-param name="pRule"
                                            select="normalize-space($pRule)"/>
                        </xsl:apply-templates>
                    </xsl:variable>
                    <xsl:if test="$translatedDetails != ''">
                        <r:Details>
                            <xsl:value-of select="$translatedDetails"/>
                        </r:Details>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </r:Fout>
    </xsl:template>

    <xsl:template match="*" mode="getDetails" priority="100">
        <xsl:param name="pRule">
            FOUT
        </xsl:param>
    </xsl:template>

    <!-- Add a error of $pRule for $pElement if $pElement doesn't satisfy the
        11-proef -->
    <xsl:template name="check11proef">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pRule">
            FOUT
        </xsl:param>
        <xsl:variable name="digit1"
                      select="floor(number($pElement/text()) div 1) mod 10"/>
        <xsl:variable name="digit2"
                      select="floor(number($pElement/text()) div 10) mod 10"/>
        <xsl:variable name="digit3"
                      select="floor(number($pElement/text()) div 100) mod 10"/>
        <xsl:variable name="digit4"
                      select="floor(number($pElement/text()) div 1000) mod 10"/>
        <xsl:variable name="digit5"
                      select="floor(number($pElement/text()) div 10000) mod 10"/>
        <xsl:variable name="digit6"
                      select="floor(number($pElement/text()) div 100000) mod 10"/>
        <xsl:variable name="digit7"
                      select="floor(number($pElement/text()) div 1000000) mod 10"/>
        <xsl:variable name="digit8"
                      select="floor(number($pElement/text()) div 10000000) mod 10"/>
        <xsl:variable name="digit9"
                      select="floor(number($pElement/text()) div 100000000) mod 10"/>

        <xsl:if
                test="((9 * $digit9 + 8 * $digit8 + 7 * $digit7 + 6 * $digit6 + 5 * $digit5 + 4 * $digit4 + 3 * $digit3 + 2 * $digit2 - 1 * $digit1) mod 11) != 0">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements" select="$pElement"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Helper for check testvalue; checks lists of values in XSLT1 -->
    <xsl:template name="split">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pValue"/>

        <xsl:choose>
            <xsl:when
                    test="string-length(normalize-space($pValue)) &gt; 0">
                <xsl:variable name="vNextItem"
                              select="normalize-space(substring-before(concat($pValue, ','), ','))"/>
                <xsl:choose>
                    <xsl:when
                            test="normalize-space($pElement/text()) = $vNextItem">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="split">
                            <xsl:with-param name="pElement" select="$pElement"/>
                            <xsl:with-param name="pValue"
                                            select="substring-after($pValue, ',')"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="callrecursive">
        <xsl:param name="pT"/>
        <xsl:param name="pValues"/>
        <xsl:param name="pText"/>
        <xsl:param name="pPattern"/>

        <xsl:choose>
            <xsl:when
                    test="string-length($pT) = 1 and string-length(translate($pT, $pValues, '')) = 0">
                <xsl:call-template name="patternmatch">
                    <xsl:with-param name="pText" select="$pText"/>
                    <xsl:with-param name="pPattern" select="$pPattern"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="patternmatch">
        <xsl:param name="pText"/>
        <xsl:param name="pPattern"/>
        <xsl:choose>
            <xsl:when
                    test="(string-length($pText) = 0 and string-length($pPattern) != 0) or (string-length($pText) != 0 and string-length($pPattern) = 0)">
                <xsl:value-of select="false()"/>
            </xsl:when>
            <xsl:when test="string-length($pText) = 0"> <!-- Nothing left to match -->
                <xsl:value-of select="true()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="t" select="substring($pText, 1, 1)"/>
                <xsl:variable name="p"
                              select="substring($pPattern, 1, 1)"/>
                <xsl:variable name="vText"
                              select="substring($pText, 2)"/>
                <xsl:variable name="vPattern"
                              select="substring($pPattern, 2)"/>
                <xsl:choose>
                    <xsl:when test="$p = '.'">
                        <xsl:call-template name="patternmatch">
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when
                            test="$p = '\' and string-length($vPattern) != 0">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues"
                                            select="substring($vPattern, 1, 1)"/>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern"
                                            select="substring($vPattern, 2)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$p = '1'">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues">
                                123456789
                            </xsl:with-param>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$p = '0'">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues">
                                0123456789
                            </xsl:with-param>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$p = 'a'">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues">
                                abcdefghijklmnopqrstuvwxyz
                            </xsl:with-param>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$p = 'A'">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues">
                                ABCDEFGHIJKLMNOPQRSTUVWXYZ
                            </xsl:with-param>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$p = 'z' or $p = 'Z'">
                        <xsl:call-template name="callrecursive">
                            <xsl:with-param name="pT" select="$t"/>
                            <xsl:with-param name="pValues">
                                abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
                            </xsl:with-param>
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$t = $p">
                        <xsl:call-template name="patternmatch">
                            <xsl:with-param name="pText" select="$vText"/>
                            <xsl:with-param name="pPattern" select="$vPattern"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Very simple pattern matching; check that pElement matches pPattern;
        '0' = any number, '1' = 1-9, 'a' = lowercase letter, 'A' = uppercase letter,
        'z'/'Z' = letter, '.' any character; unmatched characters are matched literally,
        characters can be escaped using \ to be matched literally -->
    <xsl:template name="testpattern">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pPattern" select="''"/>
        <xsl:variable name="vText" select="$pElement/text()"/>
        <xsl:call-template name="patternmatch">
            <xsl:with-param name="pText" select="$vText"/>
            <xsl:with-param name="pPattern" select="$pPattern"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Test that $pElement matches $pValues. $pValues can be '' (non-existant
        or empty), '*' (existant and non-empty), '#' (existant node), '!#' (non-existant
        node), '#<pattern>' (matching <pattern> according to testpattern), or a (list
        of) allowed/disallowed values (disallow by prefixing by !) -->
    <xsl:template name="testvalue">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pValues" select="''"/>
        <xsl:choose>
            <xsl:when test="normalize-space($pValues) = ''">
                <xsl:choose>
                    <xsl:when test="not($pElement/.)">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:when test="normalize-space($pElement/text()) = ''">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($pValues) = '*'">
                <xsl:choose>
                    <xsl:when test="normalize-space($pElement/text()) != ''">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($pValues) = '#'">
                <xsl:choose>
                    <xsl:when test="$pElement/.">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                    test="string-length(normalize-space($pValues)) > 1 and substring(normalize-space($pValues), 1, 1) = '#'">
                <xsl:call-template name="testpattern">
                    <xsl:with-param name="pElement" select="$pElement"/>
                    <xsl:with-param name="pPattern"
                                    select="substring(normalize-space($pValues), 2)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when
                    test="string-length(normalize-space($pValues)) > 1 and substring(normalize-space($pValues), 1, 1) = '!'">
                <xsl:variable name="vValue">
	                <xsl:call-template name="testvalue">
	                    <xsl:with-param name="pElement" select="$pElement"/>
	                    <xsl:with-param name="pValues"
	                                    select="substring(normalize-space($pValues), 2)"/>
	                </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                	<xsl:when test="$vValue = 'true'"><xsl:value-of select="false()"/></xsl:when>
                	<xsl:otherwise><xsl:value-of select="true()"/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="split">
                    <xsl:with-param name="pElement" select="$pElement"/>
                    <xsl:with-param name="pValue" select="$pValues"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Checks if pThis is greater than pOther or equals; generates an error
        if not -->
    <xsl:template name="checkRelation">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pOther"/>
        <xsl:param name="pRelation"/>
        <xsl:param name="pExtra" select="node()"/>
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:choose>
            <xsl:when test="normalize-space($pRelation) = 'equals'">
                <xsl:call-template name="checkRelation">
                    <xsl:with-param name="pThis" select="$pOther"/>
                    <xsl:with-param name="pOther" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsGt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
                <xsl:call-template name="checkRelation">
                    <xsl:with-param name="pThis" select="$pOther"/>
                    <xsl:with-param name="pOther" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsLt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when
                    test="normalize-space($pRelation) = 'equalsGt' and $pThis &lt; $pOther">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pRule" select="$pRule"/>
                    <xsl:with-param name="pElements"
                                    select="$pThis | $pOther | $pExtra"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="normalize-space($pRelation) = 'equalsLt'">
                <xsl:call-template name="checkRelation">
                    <xsl:with-param name="pThis" select="$pOther"/>
                    <xsl:with-param name="pOther" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsGt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="adjustDate">
        <xsl:param name="pDate"/>
        <xsl:param name="pOverflow">carry</xsl:param>

        <xsl:variable name="vDay" select="$pDate mod 100"/>
        <xsl:variable name="vMonth"
                      select="floor($pDate div 100) mod 100"/>
        <xsl:variable name="vYear"
                      select="floor($pDate div 10000) mod 10000"/>

        <!-- Adjust days for overrun -->
        <xsl:variable name="vAdjustedDay">
            <xsl:choose>
                <xsl:when
                        test="$vDay > 30 and ($vMonth = 4 or $vMonth = 6 or $vMonth = 9 or $vMonth = 11)">
                    <xsl:choose>
	                    <xsl:when test="$pOverflow = 'carry'">
		                    <xsl:value-of select="$pDate - 30 + 100"/>
	                    </xsl:when>
	                    <xsl:when test="$pOverflow = 'truncate'">
		                    <xsl:value-of select="$pDate - $vDay + 30"/>
	                    </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when
                        test="$vDay > 31 and ($vMonth = 1 or $vMonth = 3 or $vMonth = 5 or $vMonth = 7 or $vMonth = 8 or $vMonth = 10 or $vMonth = 12)">
                    <xsl:choose>
	                    <xsl:when test="$pOverflow = 'carry'">
		                    <xsl:value-of select="$pDate - 31 + 100"/>
	                    </xsl:when>
	                    <xsl:when test="$pOverflow = 'truncate'">
		                    <xsl:value-of select="$pDate - $vDay + 31"/>
	                    </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when
                        test="$vDay > 29 and $vMonth = 2 and ($vYear mod 4) = 0">
                    <xsl:choose>
	                    <xsl:when test="$pOverflow = 'carry'">
		                    <xsl:value-of select="$pDate - 29 + 100"/>
	                    </xsl:when>
	                    <xsl:when test="$pOverflow = 'truncate'">
		                    <xsl:value-of select="$pDate - $vDay + 29"/>
	                    </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when
                        test="$vDay > 28 and $vMonth = 2 and ($vYear mod 4) != 0">
                    <xsl:choose>
	                    <xsl:when test="$pOverflow = 'carry'">
		                    <xsl:value-of select="$pDate - 28 + 100"/>
	                    </xsl:when>
	                    <xsl:when test="$pOverflow = 'truncate'">
		                    <xsl:value-of select="$pDate - $vDay + 28"/>
	                    </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0 + $pDate"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Adjust months for overrun -->
        <xsl:variable name="vAdjustedMonth">
            <xsl:choose>
                <xsl:when test="floor($vAdjustedDay div 100) mod 100 > 12">
                    <xsl:value-of select="$vAdjustedDay - 1200 + 10000"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0 + $vAdjustedDay"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Return or call recursively (if we need to adjust for more than one
            overrun) -->
        <xsl:choose>
            <xsl:when test="$vAdjustedMonth = $pDate">
                <xsl:value-of select="0 + $pDate"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="adjustDate">
                    <xsl:with-param name="pDate"
                                    select="$vAdjustedMonth"/>
		            <xsl:with-param name="pOverflow" select="$pOverflow" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Adds a number of days to a date; only works for pExtra < (100 - 31) -->
    <xsl:template name="addDate">
        <xsl:param name="pDate"/>
        <xsl:param name="pExtra"/>
        <xsl:param name="pOverflow">carry</xsl:param>

		<xsl:if test="normalize-space($pDate) != ''">
	        <xsl:call-template name="adjustDate">
	            <xsl:with-param name="pDate"
	                            select="translate($pDate, '-', '') + $pExtra"/>
	            <xsl:with-param name="pOverflow" select="$pOverflow" />
	        </xsl:call-template>
		</xsl:if>
    </xsl:template>
    
    <!-- Adds a number of months to a date; only works for pExtra < (100 - 12), handles negative values -->
    <xsl:template name="addMonths">
        <xsl:param name="pDate"/>
        <xsl:param name="pExtra"/>
        <xsl:param name="pOverflow">carry</xsl:param>

		<xsl:choose>
			<xsl:when test="$pExtra &lt; 0">
		        <xsl:call-template name="addMonths">
		            <xsl:with-param name="pDate"
		                            select="translate($pDate, '-', '') - 10000"/>
		            <xsl:with-param name="pExtra" select="$pExtra + 12" />
		            <xsl:with-param name="pOverflow" select="$pOverflow" />
		        </xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
		        <xsl:call-template name="adjustDate">
		            <xsl:with-param name="pDate"
		                            select="translate($pDate, '-', '') + 100 * $pExtra"/>
		            <xsl:with-param name="pOverflow" select="$pOverflow" />
		        </xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
    
    <!--  Check that a given date intervals have no overlap -->
    <xsl:template name="checkNoOverlap">
        <xsl:param name="pStartName">Ingangsdatum</xsl:param>
        <xsl:param name="pEndName">Einddatum</xsl:param>
        <xsl:param name="pElements" />
        <xsl:param name="pExtra" select="emptyNodeSet"/>
        <xsl:param name="pRule">
            FAIL
        </xsl:param>
        
        <xsl:for-each select="$pElements">
        	<xsl:variable name="vThis" select="." />
        	<xsl:variable name="vPosition" select="position()" />
        	<xsl:variable name="vViolations" select="$pElements[position() &gt; $vPosition
        	                                           and (normalize-space($vThis/*[local-name() = $pEndName]/text()) = '' or translate(*[local-name() = $pStartName]/text(), '-', '') &lt;= translate($vThis/*[local-name() = $pEndName]/text(), '-', ''))
        	                                           and (normalize-space(*[local-name() = $pEndName]/text()) = '' or translate(*[local-name() = $pEndName]/text(), '-', '') &gt;= translate($vThis/*[local-name() = $pStartName]/text(), '-', ''))
        	                                           ]"/>
           <xsl:if test="$vViolations">
 	        	<xsl:call-template name="addError">
		        	<xsl:with-param name="pRule" select="$pRule" />
	                <xsl:with-param name="pElements" select="$vViolations | $vThis"/>
	        	</xsl:call-template>
             </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!--  Check that a given date interval is fully covered by Ingangsdatum-Einddatum of given nodes; this filters pElements for more meaningful errors -->
    <xsl:template name="checkDateCover">
        <xsl:param name="pStartName">Ingangsdatum</xsl:param>
        <xsl:param name="pEndName">Einddatum</xsl:param>
        <xsl:param name="pElements" />
        <xsl:param name="pExtra" select="emptyNodeSet"/>
        <xsl:param name="pRule">
            FAIL
        </xsl:param>
        
        <xsl:variable name="vStart" select="*[local-name() = $pStartName]/text()" />
        <xsl:variable name="vEnd" select="*[local-name() = $pEndName]/text()" />
        
        <xsl:call-template name="checkDateCoverRecursive">
	        <xsl:with-param name="pStart" select="$vStart" />
	        <xsl:with-param name="pEnd" select="$vEnd" />
	        <xsl:with-param name="pStartName" select="$pStartName" />
	        <xsl:with-param name="pEndName" select="$pEndName" />
	        <xsl:with-param name="pElements" select="$pElements[(normalize-space($vEnd) = '' or translate(./*[local-name() = $pStartName]/text(), '-', '') &lt;= translate($vEnd, '-', ''))
	        																									and (normalize-space(./*[local-name() = $pEndName]/text()) = '' or translate(./*[local-name() = $pEndName]/text(), '-', '') &gt;= translate($vStart, '-', ''))]" />
	        <xsl:with-param name="pExtra" select="$pExtra" />
	        <xsl:with-param name="pRule" select="$pRule" />
        </xsl:call-template>
    </xsl:template>
    
    
    <!--  Check that a given date interval is fully covered by Ingangsdatum-Einddatum of given nodes -->
    <xsl:template name="checkDateCoverRecursive">
        <xsl:param name="pStart" />
        <xsl:param name="pEnd" />
        <xsl:param name="pStartName" />
        <xsl:param name="pEndName" />
        <xsl:param name="pElements" />
        <xsl:param name="pExtra" select="emptyNodeSet"/>
        <xsl:param name="pRule">
            FAIL
        </xsl:param>
        <xsl:variable name="vStart" select="translate($pStart, '-', '')" />
        <xsl:if test="normalize-space($vStart) != '' and (normalize-space($pEnd) = '' or $vStart &lt;= translate($pEnd, '-', ''))">
        	<xsl:variable name="vChild"
				select="$pElements[(translate(./*[local-name() = $pStartName]/text(), '-', '') &lt;= $vStart)
																			and (normalize-space(./*[local-name() = $pEndName]/text()) = '' or translate(./*[local-name() = $pEndName]/text(), '-', '') &gt;= $vStart)
																			and (normalize-space(./*[local-name() = $pEndName]/text()) = '' or translate(./*[local-name() = $pEndName]/text(), '-', '') &gt;= translate(./*[local-name() = $pStartName]/text(), '-', ''))
																			][1]" />
        	<xsl:choose>
	        	<xsl:when test="$vChild">
	        		<xsl:call-template name="checkDateCoverRecursive">
	        			<xsl:with-param name="pStart">
	        				<xsl:call-template name="addDate">
	        					<xsl:with-param name="pDate" select="$vChild/*[local-name() = $pEndName]/text()" />
	        					<xsl:with-param name="pExtra">1</xsl:with-param>
	        				</xsl:call-template>
	        			</xsl:with-param>
	        			<xsl:with-param name="pEnd" select="$pEnd" />
				        <xsl:with-param name="pStartName" select="$pStartName" />
				        <xsl:with-param name="pEndName" select="$pEndName" />
	        			<xsl:with-param name="pElements" select="$pElements" />
	        			<xsl:with-param name="pExtra" select="$pExtra" />
	        			<xsl:with-param name="pRule" select="$pRule" />
	        		</xsl:call-template>
	        	</xsl:when>
	        	<xsl:otherwise>
	        	<xsl:call-template name="addError">
		        	<xsl:with-param name="pRule" select="$pRule" />
	                <xsl:with-param name="pElements" select="$pElements | $pExtra"/>
	        	</xsl:call-template>
	        	</xsl:otherwise>
        	</xsl:choose>
        </xsl:if>
    </xsl:template>


    <!-- Checks if Date pThis from Node pSource is equal to, or equal to or
        greater/lesser than a given pDate; generates an error if not dates must be
        formatted as YYYY-MM-DD -->
    <xsl:template name="checkDateRelation">
        <xsl:param name="pSource" select="."/>
        <xsl:param name="pThis" select="$pSource/text()"/>
        <xsl:param name="pDate">
            2018-01-01
        </xsl:param>
        <xsl:param name="pRelation"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>
        
        <xsl:choose>
            <xsl:when test="not($pSource)">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pRule" select="$pRule"/>
                    <xsl:with-param name="pElements" select="$pSource"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pRelation = 'equals'">
                <xsl:call-template name="checkDateRelation">
                    <xsl:with-param name="pThis" select="$pDate"/>
                    <xsl:with-param name="pDate" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsGt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
                <xsl:call-template name="checkDateRelation">
                    <xsl:with-param name="pThis" select="$pDate"/>
                    <xsl:with-param name="pDate" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsLt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when
                    test="$pRelation = 'equalsGt' and translate($pThis, '-', '') &lt; translate($pDate, '-', '')">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pRule" select="$pRule"/>
                    <xsl:with-param name="pElements"
                                    select="$pSource | $pExtra"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pRelation = 'equalsLt'">
                <xsl:call-template name="checkDateRelation">
                    <xsl:with-param name="pThis" select="$pDate"/>
                    <xsl:with-param name="pDate" select="$pThis"/>
                    <xsl:with-param name="pRelation">
                        equalsGt
                    </xsl:with-param>
                    <xsl:with-param name="pExtra" select="$pExtra"/>
                    <xsl:with-param name="pRule" select="$pRule"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pRelation = 'daysAfter'">
                <xsl:variable name="vDate">
                    <xsl:call-template name="addDate">
                        <xsl:with-param name="pDate" select="$pDate"/>
                        <xsl:with-param name="pExtra" select="$pExtra"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="1 * translate($pThis, '-', '') &lt;= 1 * $vDate">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pRule" select="$pRule"/>
                        <xsl:with-param name="pElements"
                                        select="$pSource | $pDate"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$pRelation = 'monthsBefore'">
                <xsl:variable name="vDate">
                    <xsl:call-template name="addMonths">
                        <xsl:with-param name="pDate" select="$pDate"/>
                        <xsl:with-param name="pExtra" select="$pExtra"/>
                        <xsl:with-param name="pOverflow">truncate</xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="1 * translate($pThis, '-', '') &gt; 1 * $vDate">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pRule" select="$pRule"/>
                        <xsl:with-param name="pElements"
                                        select="$pSource | $pDate"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$pRelation = 'monthsAfter'">
                <xsl:variable name="vDate">
                    <xsl:call-template name="addMonths">
                        <xsl:with-param name="pDate" select="$pDate"/>
                        <xsl:with-param name="pExtra" select="$pExtra"/>
                        <xsl:with-param name="pOverflow">truncate</xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="1 * translate($pThis, '-', '') &lt; 1 * $vDate">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pRule" select="$pRule"/>
                        <xsl:with-param name="pElements"
                                        select="$pSource | $pDate"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <!-- Check that $pThis is empty iff $pOther is and add an error for $pRule
        otherwise -->
    <xsl:template name="checkempty">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisEmpty">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="otherEmpty">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pOther"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$thisEmpty = 'false' and $otherEmpty = 'true'">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check pThis is equal to pOther; must be dates in the forst YYYY-MM-DD -->
    <xsl:template name="checkDateEquals">
        <xsl:param name="pThis"/>
        <xsl:param name="pOther"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:if test="$pThis and $pOther and $pThis != $pOther/text()">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check pThis comes (non-strictly) after pOther; must be dates in the
        forst YYYY-MM-DD -->
    <xsl:template name="checkafter">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:if
                test="not($pThis) or not($pOther) or translate($pOther/text(), '-', '') &gt; translate($pThis/text(), '-', '')">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check pThis comes (strictly) after pOther; must be dates in the forst
        YYYY-MM-DD -->
    <xsl:template name="checkafterstrict">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:if
                test="not($pThis) or not($pOther) or translate($pOther/text(), '-', '') &gt;= translate($pThis/text(), '-', '')">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check if pThis is in the same year as pOther; dates must be formatted
        as YYYY-MM-DD -->
    <xsl:template name="checksameyear">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:if
                test="not($pThis) or not($pOther) or substring(translate($pOther/text(), '-', ''), 1, 4) != substring(translate($pThis/text(), '-', ''), 1, 4)">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Checks if the number of years between pDate1 and pDate2 is not more
        than pYears -->
    <xsl:template name="checkYearsBetween">
        <xsl:param name="pDate1"/>
        <xsl:param name="pDate2"/>
        <xsl:param name="pYears"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            ERROR
        </xsl:param>

        <xsl:variable name="year1"
                      select="number(translate($pDate1, '-', ''))"/>
        <xsl:variable name="year2"
                      select="number(translate($pDate2, '-', ''))"/>
        <xsl:variable name="pYearsNumber"
                      select="number($pYears) * 10000"/>

        <xsl:if test="($year2 + $pYearsNumber) &lt; $year1">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pDate1 | $pDate2 | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Checks if one of periods overlay the other bidirectionally. Returns
        true when there is a overlay and false if not -->
    <xsl:template name="isPeriodOverlay">
        <xsl:param name="pThis"/>
        <xsl:param name="pOther"/>

        <xsl:choose>
            <xsl:when
                    test="$pThis/*[local-name()='Einddatum'] and $pOther/*[local-name()='Einddatum']">
                <xsl:choose>
                    <xsl:when
                            test="
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &lt;=
                            translate($pOther/*[local-name()='Einddatum'], '-', '')
                            or
                            translate($pOther/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pOther/*[local-name()='Einddatum'], '-', '') &lt;=
                            translate($pThis/*[local-name()='Einddatum'], '-', '')">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                    test="$pThis/*[local-name()='Einddatum'] and not($pOther/*[local-name()='Einddatum'])">
                <xsl:choose>
                    <xsl:when
                            test="
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &lt;=
                            '99999999'
                            or
                            '99999999' &gt;=
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') and
                            '99999999' &lt;=
                            translate($pThis/*[local-name()='Einddatum'], '-', '')">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                    test="$pOther/*[local-name()='Einddatum'] and not($pThis/*[local-name()='Einddatum'])">
                <xsl:choose>
                    <xsl:when
                            test="
                            '99999999' &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            '99999999' &lt;=
                            translate($pOther/*[local-name()='Einddatum'], '-', '')
                            or
                            translate($pOther/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pOther/*[local-name()='Einddatum'], '-', '') &lt;=
                            '99999999'">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="true()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Checks if one of period is within another period. Returns true when
        it is and false if not -->
    <xsl:template name="isPeriodWithinPeriod">
        <xsl:param name="pThis"/>
        <xsl:param name="pOther"/>

        <xsl:choose>
            <xsl:when
                    test="$pThis/*[local-name()='Einddatum'] and $pOther/*[local-name()='Einddatum']">
                <xsl:choose>
                    <xsl:when
                            test="
                    		translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '')
                            and
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &lt;=
                            translate($pOther/*[local-name()='Einddatum'], '-', '')
                            and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &lt;=
                            translate($pOther/*[local-name()='Einddatum'], '-', '')">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                    test="$pThis/*[local-name()='Einddatum'] and not($pOther/*[local-name()='Einddatum'])">
                <xsl:choose>
                    <xsl:when
                            test="
                    		translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '')
                            and
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &lt;=
                            '99999999'
                            and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Einddatum'], '-', '') &lt;=
                            '99999999'">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when
                    test="$pOther/*[local-name()='Einddatum'] and not($pThis/*[local-name()='Einddatum'])">
                <xsl:value-of select="false()"/>
            </xsl:when>
            <xsl:when
                    test="not($pOther/*[local-name()='Einddatum']) and not($pThis/*[local-name()='Einddatum'])">
                <xsl:choose>
                    <xsl:when
                            test="
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &gt;=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '') and
                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '') &lt;=
                            '99999999'">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Returns true on one day period overlay -->
    <xsl:template name="isOneDayPeriodOverlay">
        <xsl:param name="pThis"/>
        <xsl:param name="pOther"/>
        <xsl:choose>
            <xsl:when
                    test="translate($pThis/*[local-name()='Ingangsdatum'], '-', '') =
                            translate($pThis/*[local-name()='Einddatum'], '-', '')">
                <xsl:value-of select="true()"/>
            </xsl:when>
            <xsl:when
                    test="translate($pThis/*[local-name()='Ingangsdatum'], '-', '') >=
                            translate($pOther/*[local-name()='Ingangsdatum'], '-', '')">
                <xsl:choose>
                    <xsl:when test="$pOther/*[local-name()='Einddatum']">
                        <xsl:choose>
                            <xsl:when
                                    test="translate($pOther/*[local-name()='Einddatum'], '-', '') =
                                            translate($pThis/*[local-name()='Ingangsdatum'], '-', '')">
                                <xsl:value-of select="true()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="false()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$pThis/*[local-name()='Einddatum']">
                        <xsl:choose>
                            <xsl:when
                                    test="translate($pThis/*[local-name()='Einddatum'], '-', '') =
                                    translate($pOther/*[local-name()='Ingangsdatum'], '-', '')">
                                <xsl:value-of select="true()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="false()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="false()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Returns the minimum of a collection of dates; must be dates in the
        forst YYYY-MM-DD -->
    <xsl:template name="minDate">
        <xsl:param name="pAccumulator"/>
        <xsl:param name="pList"/>
        <xsl:choose>
            <xsl:when test="not($pList)">
                <xsl:value-of select="$pAccumulator"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="minDate">
                    <xsl:with-param name="pAccumulator">
                        <xsl:choose>
                            <xsl:when
                                    test="translate($pAccumulator, '-', '') &gt; translate($pList[1]/text(), '-', '')">
                                <xsl:value-of select="$pList[1]/text()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$pAccumulator"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="pList"
                                    select="$pList[position() > 1]"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Returns the maximum of a collection of dates; must be dates in the
        forst YYYY-MM-DD -->
    <xsl:template name="maxDate">
        <xsl:param name="pAccumulator" select="0000-00-00"/>
        <xsl:param name="pList"/>
        <xsl:choose>
            <xsl:when test="not($pList)">
                <xsl:value-of select="$pAccumulator"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="maxDate">
                    <xsl:with-param name="pAccumulator">
                        <xsl:choose>
                            <xsl:when
                                    test="translate($pList[1]/text(), '-', '') &gt; translate($pAccumulator, '-', '')">
                                <xsl:value-of select="$pList[1]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$pAccumulator"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="pList"
                                    select="$pList[position() > 1]"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Check that $pThis matches $pValues (same as testvalue) and add a violation
        of $pRule otherwise -->
    <xsl:template name="checkvalue">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pValues" select="''"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pCode" select="nonExistingNode"/>
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
                <xsl:with-param name="pValues" select="$pValues"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$thisCorrect = 'false'">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis|$pExtra"/>
                <xsl:with-param name="pCode" select="$pCode"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check that $pThis matches $pValues (same as testvalue) and add a violation
        of $pRule if it does -->
    <xsl:template name="checknvalue">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pValues" select="''"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
                <xsl:with-param name="pValues" select="$pValues"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$thisCorrect = 'true'">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check that $pThis matches $pValue1 (same as testvalue) and $pOther
        matches $pValue2; add a violation of $pRule if not (pThis => pOther), i.e.,
        if this matches and other doesn't -->
    <xsl:template name="checkimplication">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pValue1" select="''"/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pValue2" select="''"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
                <xsl:with-param name="pValues" select="$pValue1"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="otherCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pOther"/>
                <xsl:with-param name="pValues" select="$pValue2"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if
                test="$thisCorrect = 'true' and $otherCorrect = 'false'">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis|$pOther|$pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check that $pThis matches $pValue1 (same as testvalue) and $pOther
        matches $pValue2; add a violation of $pRule if they don't both match or none
        matches -->
    <xsl:template name="checksame">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pValue1" select="''"/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pValue2" select="''"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
                <xsl:with-param name="pValues" select="$pValue1"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="otherCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pOther"/>
                <xsl:with-param name="pValues" select="$pValue2"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$thisCorrect != $otherCorrect">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis | $pOther | $pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Check that $pThis matches $pValue1 (same as testvalue) and $pOther
        matches $pValue2; add a violation of $pRule if both don't match -->
    <xsl:template name="checkSingleCorrect">
        <xsl:param name="pThis" select="."/>
        <xsl:param name="pValue1" select="''"/>
        <xsl:param name="pOther" select="."/>
        <xsl:param name="pValue2" select="''"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:variable name="thisCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pThis"/>
                <xsl:with-param name="pValues" select="$pValue1"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="otherCorrect">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pOther"/>
                <xsl:with-param name="pValues" select="$pValue2"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if
                test="$thisCorrect = 'false' and $otherCorrect = 'false'">
            <xsl:call-template name="addError">
                <xsl:with-param name="pRule" select="$pRule"/>
                <xsl:with-param name="pElements"
                                select="$pThis|$pOther|$pExtra"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="inList">
        <xsl:param name="pList"/>
        <xsl:param name="pValue"/>
        <xsl:param name="pCurrent" select="nonExistingNode"/>

        <xsl:choose>
            <xsl:when test="not($pCurrent) and $pList > 1">
                <xsl:call-template name="inList">
                    <xsl:with-param name="pList" select="$pList"/>
                    <xsl:with-param name="pValue" select="$pValue"/>
                    <xsl:with-param name="pCurrent" select="$pList[1]"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$pValue = $pList[1]">
                <xsl:value-of select="true()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$pCurrent = $pValue">
                        <xsl:value-of select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="count($pList) > 0">
                            <xsl:call-template name="inList">
                                <xsl:with-param name="pList"
                                                select="$pList[position() > 1]"/>
                                <xsl:with-param name="pValue" select="$pValue"/>
                                <xsl:with-param name="pCurrent"
                                                select="$pList[1]"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="transformKeys">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pKeys"/>

        <xsl:for-each select="$pElement">

            <xsl:variable name="keys">
                <xsl:call-template name="evaluateXPath">
                    <xsl:with-param name="pContext" select="current()"/>
                    <xsl:with-param name="pPath">
                        <xsl:value-of
                                select="substring-before(normalize-space($pKeys), ',')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            <xsl:value-of select="$keys"/>
            <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            <xsl:if
                    test="contains($pKeys, ',') and substring-after(normalize-space($pKeys), ',')">
                <xsl:call-template name="transformKeys">
                    <xsl:with-param name="pElement" select="current()"/>
                    <xsl:with-param name="pKeys"
                                    select="substring-after(normalize-space($pKeys), ',')"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="checkDuplicateKeys">
        <xsl:param name="pElement" select="."/>
        <xsl:param name="pKeys"/>
        <xsl:param name="pExtra"
                   select="emptyNodeSet"/> <!-- Selecting a not existing node so the default value'll be an empty node-set -->
        <xsl:param name="pRule">
            FAIL
        </xsl:param>

        <xsl:for-each select="$pElement">

            <xsl:variable name="keys1">
                <xsl:call-template name="transformKeys">
                    <xsl:with-param name="pElement" select="current()"/>
                    <xsl:with-param name="pKeys" select="$pKeys"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="position" select="position()"/>

            <xsl:for-each select="$pElement[position() > $position]">
                <xsl:variable name="keys2">
                    <xsl:call-template name="transformKeys">
                        <xsl:with-param name="pElement" select="current()"/>
                        <xsl:with-param name="pKeys" select="$pKeys"/>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:if
                        test="$keys1 = $keys2 and $keys1 != '' and $keys2 != ''">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pRule" select="$pRule"/>
                        <xsl:with-param name="pElements"
                                        select="$pElement[position() = $position]|current() | $pExtra"/>
                    </xsl:call-template>
                </xsl:if>
                <!--keys:<xsl:value-of select="$keys1"/> -->
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="formatNumberInternal">
        <xsl:param name="pValue"/>
        <xsl:if test="$pValue &gt; 0">
            <xsl:call-template name="formatNumberInternal">
                <xsl:with-param name="pValue" select="floor(number($pValue) div 10)"/>
            </xsl:call-template>
            <xsl:value-of select="number($pValue) mod 10"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="formatNumber">
        <xsl:param name="pValue"/>
        <xsl:choose>
            <xsl:when test="number($pValue) &lt; 0">-
                <xsl:call-template name="formatNumberInternal">
                    <xsl:with-param name="pValue" select="0 - number($pValue)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="number($pValue) = 0">0</xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="formatNumberInternal">
                    <xsl:with-param name="pValue" select="number($pValue)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[local-name()='BerichtCode']"
                  mode="header">
        <r:BerichtCode>
            <xsl:value-of select="text()"/>
        </r:BerichtCode>
    </xsl:template>
    <xsl:template match="*[local-name()='BerichtVersie']"
                  mode="header">
        <r:BerichtVersie>
            <xsl:value-of select="text()"/>
        </r:BerichtVersie>
    </xsl:template>
    <xsl:template match="*[local-name()='BerichtSubversie']"
                  mode="header">
        <r:BerichtSubversie>
            <xsl:value-of select="text()"/>
        </r:BerichtSubversie>
    </xsl:template>
    <xsl:template
            match="*[local-name()='Identificatie'] | *[local-name()='DeclarantFactuurNummer']"
            mode="header">
        <r:Identificatie>
            <xsl:value-of select="normalize-space(text())"/>
        </r:Identificatie>
    </xsl:template>
    <xsl:template
            match="*[local-name()='Dagtekening'] | *[local-name()='FactuurDagtekening']"
            mode="header">
        <r:Dagtekening>
            <xsl:value-of select="text()"/>
        </r:Dagtekening>
    </xsl:template>
    <xsl:template
            match="*[local-name()='BerichtIdentificatie'] | *[local-name()='DeclaratieFactuurIdentificatie']"
            mode="header">
        <r:BerichtIdentificatie>
            <xsl:apply-templates select="*" mode="header"/>
        </r:BerichtIdentificatie>
    </xsl:template>

    <xsl:variable name="xsltVersion">
        1.9.17
    </xsl:variable>

    <xsl:template match="*|@*|text()" mode="check"/>
    <xsl:template match="*|@*|text()" mode="header">
        <xsl:apply-templates select="*" mode="header"/>
    </xsl:template>
    <xsl:template match="*|@*|text()" mode="traverse">
        <xsl:apply-templates select="*" mode="traverse"/>
        <xsl:apply-templates select="." mode="check"/>
    </xsl:template>
    <xsl:template match="*[local-name() = 'Bericht']">
        <r:Rapport>
            <r:Header>
                <xsl:apply-templates
                        select="//*[local-name() = 'Header']" mode="header"/>
                <xsl:if test="not(contains($xsltVersion, '-SNAPSHOT'))">
                    <r:XSLTVersie>
                        <xsl:value-of select="normalize-space($xsltVersion)"/>
                    </r:XSLTVersie>
                </xsl:if>
                <xsl:comment>
                    XSLT<xsl:copy-of select="system-property('xsl:version')"/>(<xsl:copy-of
                        select="system-property('xsl:vendor')"/>)
                    XSLT validatie 1.9.17
                </xsl:comment>
            </r:Header>
            <r:Fouten>
                <xsl:apply-templates select="*" mode="traverse"/>
            </r:Fouten>
        </r:Rapport>
    </xsl:template>
</xsl:stylesheet>
