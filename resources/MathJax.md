[//]: # (1.需要补充团队CDN地址)
[//]: # (2.需要补充线上demo)

# MathJax

### MathJax 是什么？

MathJax 是一个 `JavaScript` 数学公式渲染引擎，它能够将浏览器页面中的 LaTeX, MathML, AsciiMath 标记渲染成指定的输出格式（ HTML, SVG, MathML）

>[详情参见](https://docs.mathjax.org/en/latest/start.html)


### 配置

>目前团队用的是 SVG 格式输出，所以以下的内容都是以 SVG 格式输出为基础的，更多配置信息请移步官网 [SVG 配置](https://docs.mathjax.org/en/latest/options/output-processors/SVG.html)

>[其他输出格式配置参考](http://docs.mathjax.org/en/latest/options/output-processors/index.html)

```js
<script type="text/x-mathjax-config">
  MathJax.Hub.Register.StartupHook("TeX Jax Ready", function() {
    MathJax.InputJax.TeX.prefilterHooks.Add(function(data) {
        if (!data.display) {
            data.math = "\\displaystyle{" + data.math + "}"
        }
    });
  });
  MathJax.Hub.Config({
     jax: ["input/TeX", "output/SVG"],
     extensions: ["tex2jax.js"],
     TeX: {
        extensions: ["AMSmath.js", "AMSsymbols.js", "noErrors.js", "noUndefined.js"]
     },
     tex2jax: {
       ignoreClass: 'ignore_math',
       inlineMath: [
         ["$", "$"],
         ["\\", "\\"]
       ]
     },
     showMathMenu: false,
     displayAlign: "left",
     "SVG": {
       linebreaks: {
         automatic: true,
         width: "container"
       },
       scale: 80
     }
  });     
</script>
```

### 引入
> 注意引入资源必须在配置之后

```html
<script type="text/javascript" async src="path-to-mathjax/MathJax.js"></script>
```

### 调用
>渲染可以是任意指定的 DOM 区域，如果不指定渲染区域，MathJax将渲染整个页面，[查看更多](http://docs.mathjax.org/en/latest/advanced/typeset.html?highlight=MathJax.Hub.Typeset)

```js
var math = document.getElementById("MathExample");
MathJax.Hub.Queue(["Typeset", MathJax.Hub, math]);
```