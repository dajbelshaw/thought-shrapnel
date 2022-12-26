<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />

	<xsl:template match="/rss/channel">

		<html lang="en">
		<head>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />

			<title>
				<xsl:value-of select="title" />
			</title>
			<link rel="stylesheet" type="text/css" href="./style.css" media="screen" />

			<!-- Update the data in the three lines below-->
			
			<link rel="alternate" type="application/atom+xml" title="Feed" href="./index.xml" />
			<title>Title</title>
			<meta name="description" content="Description" />

		</head>
		<body>

			<header>
				<!-- Add header image as defined in index.xml -->

				<xsl:if test="/rss/channel/image">
                    			<a class="head_logo">
                        		<xsl:attribute name="href">
                            		<xsl:value-of select="/rss/channel/link" />
                        		</xsl:attribute>
                        		<img width="200px">
                        		<xsl:attribute name="src">
                            		<xsl:value-of select="/rss/channel/image/url" />
                       		 	</xsl:attribute>
                        		<xsl:attribute name="title">
                            		<xsl:value-of select="/rss/channel/title" />
                        		</xsl:attribute>
                       			</img>
                    			</a>
                		</xsl:if>
				<h1 class="title">
					<xsl:value-of select="title" />
				</h1>

				<p class="description" style="padding-top:0 !important;">
					<xsl:value-of select="description" />
				</p>
		        <nav>
		  <a href="./">Home</a>
		  <a href="./about">About</a>
		  <a href="./faq">FAQ</a>
		  <a href="./subscribe">Subscribe</a>
		  <a href="https://web.archive.org/web/20221215063913/thoughtshrapnel.com">Archive</a>
			</nav>
		  </header>

			<ul class="posts" style="list-style-type: none !important;">
				<xsl:for-each select="./item[position() &lt;= 20]">

					<li class="posts__post post" style="padding-top:1.25em !important;">

						<p class="post__title">
							 <a href="{ link }" class="post__link">
								<strong>
									<xsl:value-of select="title" />
								 </strong>
							 </a>&#32;
 							&#40;<xsl:value-of select="source" />&#41;
						</p>

						<p class="post__preview">
							<xsl:value-of select="description" />
						</p>

						<p class="post__date" style="font-size:0.7em !important;">
							<xsl:value-of select="pubDate" />
						</p>

					</li>

				</xsl:for-each>
			</ul>

			<footer>
  				<p><a href="https://github.com/dajbelshaw/styled-rss"><img src="./img/github-mark-white.png" alt="GitHub logo" width="20px" /></a></p>
			</footer>

		</body>
		</html>

	</xsl:template>

</xsl:stylesheet>
