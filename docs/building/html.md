# HTML \<--\> SMS

TBD intro

# Tags detailed description

<table style="width:100%;">
<thead>
<tr class="header">
<th style="min-width:5%;"></th>
<th style="min-width:25%;"><p><strong>Tag</strong></p></th>
<th style="min-width:45%;width:45%"><p><strong>Tag description</strong></p></th>
<th style="min-width:10%;width:10%;"><p><strong>Examples</strong></p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td><p>&lt;section&gt;&lt;/section&gt;</p></td>
<td><p>Declares a page (menu, text, wizard step).</p>
<p><strong>ATTRS</strong>:</p>
<ul>
<li><p><code>name</code> - required when <code>&lt;section&gt;</code> is a <code>&lt;form&gt;</code>'s child</p></li>
<li><p><code>header</code> - optional</p></li>
<li><p><code>footer</code> - optional</p></li>
</ul></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb1" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb1-1"><a href="#cb1-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb1-2"><a href="#cb1-2"></a>  ...</span>
<span id="cb1-3"><a href="#cb1-3"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td>2</td>
<td><p>&lt;header&gt;&lt;/header&gt;</p></td>
<td><p>Declares the header of a page. It overwrites the <code>header</code> attribute from <code>&lt;section&gt;</code></p>
<p>A page does not need to declare a header, but the SMS will have a header anyway.</p>
<p>It is displayed as the first text line of a page and it is preceded by <code>#</code>.</p>
<p><strong>ATTRS</strong>: None</p></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb2" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb2-1"><a href="#cb2-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb2-2"><a href="#cb2-2"></a>  <span class="kw">&lt;header&gt;</span></span>
<span id="cb2-3"><a href="#cb2-3"></a>    #SETUP ONEM NAME</span>
<span id="cb2-4"><a href="#cb2-4"></a>  <span class="kw">&lt;/header&gt;</span></span>
<span id="cb2-5"><a href="#cb2-5"></a>  ...</span>
<span id="cb2-6"><a href="#cb2-6"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="odd">
<td>3</td>
<td><p>&lt;footer&gt;&lt;/footer&gt;</p></td>
<td><p>Declares the footer of a page. It overwrites the <code>footer</code> attribute from <code>&lt;section&gt;</code>.</p>
<p>A page does not need to declare a footer, but the SMS will have a footer anyway.</p>
<p>It should be relative short line of text and it is shown in the last chunk of a page, preceded by <code>--</code>.</p>
<p><strong>ATTRS</strong>: None</p></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb3" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb3-1"><a href="#cb3-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb3-2"><a href="#cb3-2"></a>  ...</span>
<span id="cb3-3"><a href="#cb3-3"></a>  <span class="kw">&lt;footer&gt;</span></span>
<span id="cb3-4"><a href="#cb3-4"></a>    --Reply with text</span>
<span id="cb3-5"><a href="#cb3-5"></a>  <span class="kw">&lt;/footer&gt;</span></span>
<span id="cb3-6"><a href="#cb3-6"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td>4</td>
<td><p>&lt;form&gt;&lt;/form&gt;</p></td>
<td><p>The equivalent of a Nautilus wizard. It must contain at least 1 page (WizardStep). See <code>&lt;section&gt;</code> tag.</p>
<p><strong>ATTRS</strong>:</p>
<ul>
<li><p><code>action</code> - (required)</p></li>
<li><p><code>method</code> - (default “POST”)</p></li>
<li><p><code>header</code> - (optional)</p></li>
<li><p><code>footer</code> - (optional)</p></li>
<li><p><code>completionStatusShow</code> - (optional)</p></li>
<li><p><code>completionStatusInHeader</code> - (optional)</p></li>
<li><p><code>confirmationNeeded</code> - (optional)</p></li>
</ul></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb4" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb4-1"><a href="#cb4-1"></a><span class="kw">&lt;form</span><span class="ot"> action=</span><span class="st">&quot;/path-1&quot;</span><span class="ot"> method=</span><span class="st">&quot;POST&quot;</span><span class="kw">&gt;</span>  <span class="co">&lt;!-- Wizard --&gt;</span></span>
<span id="cb4-2"><a href="#cb4-2"></a>  <span class="kw">&lt;section</span><span class="ot"> name=</span><span class="st">&quot;first-step&quot;</span><span class="kw">&gt;</span>  <span class="co">&lt;!-- Wizard step --&gt;</span></span>
<span id="cb4-3"><a href="#cb4-3"></a>    ...</span>
<span id="cb4-4"><a href="#cb4-4"></a>  <span class="kw">&lt;/section&gt;</span></span>
<span id="cb4-5"><a href="#cb4-5"></a><span class="kw">&lt;/form&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="odd">
<td>5</td>
<td><p>&lt;input/&gt;</p></td>
<td><p>Used inside a <code>&lt;form&gt;&lt;/form&gt;</code> when the user is asked to send data of a certain type</p>
<p><strong>ATTRS</strong>:</p>
<ul>
<li><p><code>type</code> - (required) One of: “text”, “date”, “datetime”</p></li>
</ul></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb5" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb5-1"><a href="#cb5-1"></a><span class="kw">&lt;form</span><span class="ot"> action=</span><span class="st">&quot;/path-2&quot;</span><span class="ot"> method=</span><span class="st">&quot;POST&quot;</span><span class="kw">&gt;</span>  <span class="co">&lt;!-- Wizard --&gt;</span></span>
<span id="cb5-2"><a href="#cb5-2"></a>  <span class="kw">&lt;section</span><span class="ot"> name=</span><span class="st">&quot;first-step&quot;</span><span class="kw">&gt;</span>  <span class="co">&lt;!-- Wizard step --&gt;</span></span>
<span id="cb5-3"><a href="#cb5-3"></a>    <span class="kw">&lt;header&gt;</span></span>
<span id="cb5-4"><a href="#cb5-4"></a>      # SETUP ONEM NAME</span>
<span id="cb5-5"><a href="#cb5-5"></a>    <span class="kw">&lt;/header&gt;</span></span>
<span id="cb5-6"><a href="#cb5-6"></a>    </span>
<span id="cb5-7"><a href="#cb5-7"></a>    <span class="kw">&lt;label&gt;</span></span>
<span id="cb5-8"><a href="#cb5-8"></a>      Send your ONEm name</span>
<span id="cb5-9"><a href="#cb5-9"></a>    <span class="kw">&lt;/label&gt;</span></span>
<span id="cb5-10"><a href="#cb5-10"></a>    </span>
<span id="cb5-11"><a href="#cb5-11"></a>    <span class="kw">&lt;input</span><span class="ot"> type=</span><span class="st">&quot;text&quot;</span><span class="kw">/&gt;</span></span>
<span id="cb5-12"><a href="#cb5-12"></a></span>
<span id="cb5-13"><a href="#cb5-13"></a>    <span class="kw">&lt;footer&gt;</span></span>
<span id="cb5-14"><a href="#cb5-14"></a>      Reply text</span>
<span id="cb5-15"><a href="#cb5-15"></a>    <span class="kw">&lt;/footer&gt;</span></span>
<span id="cb5-16"><a href="#cb5-16"></a>  <span class="kw">&lt;/section&gt;</span></span>
<span id="cb5-17"><a href="#cb5-17"></a><span class="kw">&lt;/form&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td>6</td>
<td><p>&lt;label&gt;&lt;/label&gt;</p></td>
<td><p>Used inside forms to add text</p></td>
<td></td>
</tr>
<tr class="odd">
<td>7</td>
<td><p>&lt;ul&gt;&lt;/ul&gt;</p></td>
<td><p>Declares a list (OptionList). It must contain at least 1 <code>&lt;li&gt;</code> tag.It can only be the child for a page (within a form or not).</p>
<p>When rendered, it will be a <del>numbered</del> selectable list (preceded by a letter or a number). See <code>&lt;li&gt;</code> tag.</p>
<p><strong>ATTRS</strong>: None</p></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb6" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb6-1"><a href="#cb6-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb6-2"><a href="#cb6-2"></a>  ...</span>
<span id="cb6-3"><a href="#cb6-3"></a>  <span class="kw">&lt;ul&gt;</span></span>
<span id="cb6-4"><a href="#cb6-4"></a>    ...</span>
<span id="cb6-5"><a href="#cb6-5"></a>  <span class="kw">&lt;/ul&gt;</span></span>
<span id="cb6-6"><a href="#cb6-6"></a>  ...</span>
<span id="cb6-7"><a href="#cb6-7"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td>8</td>
<td><p>&lt;li&gt;&lt;/li&gt;</p></td>
<td><p>Declares a list item (OptionItem). It can stay only inside a <code>&lt;ul&gt;&lt;/ul&gt;</code> tag.</p>
<p>If it contains an <code>&lt;a&gt;</code> tag, it will be selected (preceded by a letter or a number). Otherwise it’s a separator item.</p>
<p><strong>ATTRS</strong>:</p>
<ul>
<li><p><code>value</code> - (optional) if not inside a form it is ignored. If value is NULL, then the menu item is a separator item. If not NULL, the menu item is selectable.</p></li>
</ul></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb7" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb7-1"><a href="#cb7-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb7-2"><a href="#cb7-2"></a>  ...</span>
<span id="cb7-3"><a href="#cb7-3"></a>  <span class="kw">&lt;ul&gt;</span></span>
<span id="cb7-4"><a href="#cb7-4"></a>    <span class="kw">&lt;li&gt;</span></span>
<span id="cb7-5"><a href="#cb7-5"></a>      One option</span>
<span id="cb7-6"><a href="#cb7-6"></a>    <span class="kw">&lt;/li&gt;</span></span>
<span id="cb7-7"><a href="#cb7-7"></a>    <span class="kw">&lt;li&gt;</span></span>
<span id="cb7-8"><a href="#cb7-8"></a>      Another option</span>
<span id="cb7-9"><a href="#cb7-9"></a>    <span class="kw">&lt;/li&gt;</span></span>
<span id="cb7-10"><a href="#cb7-10"></a>  <span class="kw">&lt;/ul&gt;</span></span>
<span id="cb7-11"><a href="#cb7-11"></a>  ...</span>
<span id="cb7-12"><a href="#cb7-12"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="odd">
<td>9</td>
<td><p>&lt;a&gt;&lt;/a&gt;</p></td>
<td><p>It marks a numbered list item.</p>
<p><strong>ATTRS</strong>:</p>
<ul>
<li><p><code>href</code> - (required)</p></li>
<li><p><code>method</code> - (optional) default “GET”</p></li>
</ul></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb8" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb8-1"><a href="#cb8-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb8-2"><a href="#cb8-2"></a>  ...</span>
<span id="cb8-3"><a href="#cb8-3"></a>  <span class="kw">&lt;ul&gt;</span></span>
<span id="cb8-4"><a href="#cb8-4"></a>    <span class="kw">&lt;li&gt;</span></span>
<span id="cb8-5"><a href="#cb8-5"></a>      <span class="kw">&lt;a</span><span class="ot"> href=</span><span class="st">&quot;/routes/1&quot;</span><span class="kw">&gt;</span>Go to route 1<span class="kw">&lt;/a&gt;</span></span>
<span id="cb8-6"><a href="#cb8-6"></a>    <span class="kw">&lt;/li&gt;</span></span>
<span id="cb8-7"><a href="#cb8-7"></a>    <span class="kw">&lt;li&gt;</span>Separator<span class="kw">&lt;/li&gt;</span></span>
<span id="cb8-8"><a href="#cb8-8"></a>    <span class="kw">&lt;li&gt;</span></span>
<span id="cb8-9"><a href="#cb8-9"></a>      <span class="kw">&lt;a</span><span class="ot"> href=</span><span class="st">&quot;/routes/2&quot;</span><span class="kw">&gt;</span>Go to route 2<span class="kw">&lt;/a&gt;</span></span>
<span id="cb8-10"><a href="#cb8-10"></a>    <span class="kw">&lt;/li&gt;</span></span>
<span id="cb8-11"><a href="#cb8-11"></a>  <span class="kw">&lt;/ul&gt;</span></span>
<span id="cb8-12"><a href="#cb8-12"></a>  ...</span>
<span id="cb8-13"><a href="#cb8-13"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td>10</td>
<td><p>&lt;p&gt;&lt;/p&gt;</p></td>
<td><p>Renders a line of text. It can be used also as a label in a form.</p></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb9" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb9-1"><a href="#cb9-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb9-2"><a href="#cb9-2"></a>  ...</span>
<span id="cb9-3"><a href="#cb9-3"></a>  <span class="kw">&lt;p&gt;</span>This is the first line<span class="kw">&lt;/p&gt;</span></span>
<span id="cb9-4"><a href="#cb9-4"></a>  </span>
<span id="cb9-5"><a href="#cb9-5"></a>  <span class="kw">&lt;p&gt;</span>This is the second line<span class="kw">&lt;/p&gt;</span></span>
<span id="cb9-6"><a href="#cb9-6"></a>  ...</span>
<span id="cb9-7"><a href="#cb9-7"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="odd">
<td>11</td>
<td><p>&lt;br/&gt;</p></td>
<td><p>Renders a new line.</p></td>
<td><div class="code panel pdl" style="border-width: 1px;">
<div class="codeContent panelContent pdl">
<div class="sourceCode" id="cb10" data-syntaxhighlighter-params="brush: html; gutter: false; theme: Confluence" data-theme="Confluence" style="brush: html; gutter: false; theme: Confluence"><pre class="sourceCode html"><code class="sourceCode html"><span id="cb10-1"><a href="#cb10-1"></a><span class="kw">&lt;section&gt;</span></span>
<span id="cb10-2"><a href="#cb10-2"></a>  ...</span>
<span id="cb10-3"><a href="#cb10-3"></a>  <span class="kw">&lt;p&gt;</span>This is the first line<span class="kw">&lt;/p&gt;</span></span>
<span id="cb10-4"><a href="#cb10-4"></a>  <span class="kw">&lt;br/&gt;</span></span>
<span id="cb10-5"><a href="#cb10-5"></a>  <span class="kw">&lt;p&gt;</span>This is the third line<span class="kw">&lt;/p&gt;</span></span>
<span id="cb10-6"><a href="#cb10-6"></a>  ...</span>
<span id="cb10-7"><a href="#cb10-7"></a><span class="kw">&lt;/section&gt;</span></span></code></pre></div>
</div>
</div></td>
</tr>
</tbody>
</table>

# Examples

Now let's glue everything together and see some real examples:
