<!DOCTYPE html>
<html lang="zh-CN">
<#import "common/header.ftl" as headInfo>
<@headInfo.head title="友情链接" type="links"/>
<style>
  html[data-mode='dark'] .joe_detail__friends {
    -webkit-filter: brightness(0.7);
    filter: brightness(0.7);
  }
</style>
<body>
    <div id="Joe">
        <#include "common/navbar.ftl">
        <div class="joe_container joe_main_container">
            <div class="joe_main">
                <div class="joe_detail">
                    <h1 class="joe_detail__title">友情链接</h1>
                    <article class="joe_detail__article">
                      <h5>本站友链列表</h5>
                      <ul class="joe_detail__friends">
                          <#assign colors=["#F8D800", "#0396FF", "#EA5455", "#7367F0", "#32CCBC", "#F6416C", "#28C76F", "#9F44D3", "#F55555", "#736EFE", "#E96D71", "#DE4313", "#D939CD", "#4C83FF", "#F072B6", "#C346C2", "#5961F9", "#FD6585", "#465EFB", "#FFC600", "#FA742B", "#5151E5", "#BB4E75", "#FF52E5", "#49C628", "#00EAFF", "#F067B4", "#F067B4", "#ff9a9e", "#00f2fe", "#4facfe", "#f093fb", "#6fa3ef", "#bc99c4", "#46c47c", "#f9bb3c", "#e8583d", "#f68e5f"]>
                          <#assign nextRandom = .now?string["HHmmssSSS"]?number>
                          <@linkTag method="list">
                            <#list links as link>
                                  <li class="joe_detail__friends-item">
                                      <a class="contain" href="${link.url!}" target="_blank" style="background:${colors[nextRandom % colors?size]}" rel="noopener noreferrer">
                                      <span style="font-weight:bold;" class="title">${link.name!}</span>
                                      <div class="content">
                                          <div class="desc" title="${link.description!}">${link.description!}</div>
                                          <img width="40" height="40" class="avatar lazyload" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAMAAAC5zwKfAAAC/VBMVEUAAAD87++g2veg2ff++fmg2feg2fb75uag2fag2fag2fag2fag2feg2vah2fef2POg2feg2vag2fag2fag2fag2fag2vah2fag2vb7u3Gg2fag2fb0tLSg2fb3vHig2ff0s7P2wMD0s7Og2fXzs7Pzs7Of2fWh2veh2vf+/v7///+g2vf9/f2e1/ag2fSg2/mg3PT3r6+30tSh2fb+0Hj76ev4u3P6u3K11dr60H3UyKr+/v766On80Hz49vj2xcXm5u3z0IfUx6v2u7vazKTn0pfi6PKg2fbztLT///+g2faf2fag2vf///+g2feg2fe63O6l3vb///+g2fb80Kb8um+x1uD80Hv86er+0Hf73tb0s7P10YX/0Hiq2Or+/v6g2vbe0qL60YT+/v6y1NzuvoS20dSz09ru0Y6z3fTI1MDbxp+h2fag2fb////O4PDuv4XA3/LOz7bh06Du0o/1t7ex3PP+/v6h2ffSzrLdxZ3s5u3/2qag2fb7+/z40NCg2fb9/f2f2PWf2PX0tLT+/v70s7P+/v7M7Pyf1/b1s7P////zs7P0tbWZ2fL20dH+/v7+0Hep2vWl2O+x2/P+/v641tbI1b7C1cf8xpCz0tj1wMD1x8fTya392KPo0ZT56ez4vXbN1bn26Orh0p3x8/jbxZ/CzcT8xo7327DV1tHt0Y7u8/n759661tLyy6L049710IK8z870s7PX1a3xvX/y6OzA1cvBzsXI1cG30dP+38D73Mn/0oX3ysrpwYzv5+zo0pXv5+zH4PDW4e/n5O3+/v786+vN4vP9/f30s7P9/f2f2fSu0er//Pzgu8X///+4zOD////z8/OW0vCq1f+g2fb86er0s7P+z3f8um/+/v72xcX948ym2O/85+T839D8v3v86ej54eH828X+3Kz80qz8w4T8u3Oq2/Wq1ees2Ob64OCx1d/F2N785tv529v94MH82b/1vb382bj93LD91pf91ZH+04b+0X2p2er+2aH8zJ78yZX8yJU3IRXQAAAA1nRSTlMA8PbEz5vhv1X6Y0wzrX9A8/DJt6mHsnH98uzo4NzY19DJwKGAf3tpZmVVSD86LysgIP787ejn4uHf29jW1M3MysnHxcK+vbywn5ONg39wW0AlIBr8+/f29PTx7+rm5eTj4+Df29nX1tLR0dHQz8zKyMXFxcPCwL+9u7u5t7KsqaObmH1wbWBcVVJQSUAwFA34+Pbz8vHx8O7u7ero6Ofl4ODf3t7d3Nvb2djY19fU1NLS0M/NzcrJycjHx8LCwcHAwL68uraxr5SSkId4X1NTNTItFREGybAGmgAABQNJREFUWMOl13N0HEEcwPFp2lzTpElq20jTpLZt27Zt27Zt27b7m9vbpqlt+3Xvdvd2ZncWufv+e+993t7saJFJ0wL8M1UKjJ4yTpyU0QMrZfIPmIa8qLZ/edBU3r+2Z1pY5qGg09DMYVHmsicCwxJljxIXnABMSxBsmcsxAiw1IoclLtQXLOcbau75tYAo1MLPzMsEUSyTsZceolx6Iy86eFB0fS8ZeFQyPS85eFhythcfPC4+y0sIXpRQ6yUGr0qs9vzBy/xpLwC8LsDghXj/YvzApJdgHrmsB4BuzfaXKVkwT6u6+VL1KNXOEBygeNVBrwJlm3LOlj13OEtV6r6BWN10Cc/rwEl9rOMQy1fIYFGbTZk9Mzm5iEYOubYFTKdOPPa/LckpvccP3WLSUnpgPOkIAVb1CnJEGP9xKHXWE8VDpgowekt5PzD+5CDSG8gqLrALaHvdhCP7hnHkQ1Jcyga7OL3YwGgNR/UUY1yHBOvmYouxdbatBRzdRwF84CBrq7+NpQZN91vR3s9HWOifw3wYUyOUE7St4uh+Y6x5xHzALCeaCNo2q8AI7OoZJbJHcSLKDJp+cepXIhb5nATXMcHMKAg0zedUc0buATl1kjLBIOQLmlqqn08RXxAic+PxRYyL5XLS+4rJnhD/+hXzIsraGYhV8j0C00U+kx7yxd937P3BBprqu5fw10dY04Mnn748exKJMRO0oVhA16l3h40u8ef3L5HYqO2DetXTgLGQD1CVFajDOCIi4j02a6HDkb+NGvRR3ZA4Z0OwlcQtd5Hm3pRSO2GOWvKKiLNRNXlSoq7kLsi5arjVCniEuXt3pU68Thxn/T9vEMGVqpOPWinysVTUgrfDIdVetVKygFIeGTxhDm6SwYEUmIU8AZpxUgN7mnqnIL8EHqfPAPKmflDy8syGwSZe3n4wSAJTUfd36ibXWwJPAtiKGINnANo4pHKTdzrqLrxT9PqAUD9D7ywIHUgqgu2omzF5qDR0eWXB1WkDb7W4XneJw1iGPFLIu9c2J9dU+DkJOCunP4A2EGu/1wn2UN+/RoNYH2G+9PIRPBGEnnnZXom4irA+lSAeArnRiHF1SOIe5DklGNyK7kCV6+2r+8qkYX2C5iZ2yI6DG9BcgxIvLXyYBtNbpAASZDllAj3a130WGBWMpAIpkNpyEwTVrnmh3Ja1xYoVG3atFgqtVl7fC2R/9vj4EFz2kKojeaL+VW/FrhTH/NNnFBP0rZExBq/pfMabVeKyvFFIKcxGgNIYpr6asbFdAh9/XlxRBmPaG2cMDdR6tjACJDexONLjXU9ht8vgG3sK1NoN2u27p1bTgFkQVaAK9Btutysg/jA8K6+AQuP8NG+ErqaNAoOz3ZNBORpMN5YWbTWRKvfvcV0erwKbt6bBvvz4YPrLUVNCBQzKxtPg48/pkBrkswWRd2tGCWQwdY3CIki9FBoszfOFa8R1z1fEzFecNlC9Iq8C8YfHvAbkR1ZzH3U6VRaveJN5AqSiQX6yuJVWRrq5RiWgmwJG09bI7iwtL9QtQLwFG5QYIN54XgbZKSCf1QaxsiPDYkPl/tbBYVfi3UEm3Z3AWwfnTkDmjbUEFuddVUUWylrYKtg8K7LU7cszLIEXpyOr1arILzEGj/HnQswUmgyZeimNnpZmTHjIDeRB4WMYZoVx4ciLwqdMypChQroUwmOlq5Ahw6QpZuP2HxxXd11eM9wcAAAAAElFTkSuQmCC" data-src="${link.logo!}" alt="${link.name!}">
                                      </div>
                                      </a>
                                  </li>
                                  <#assign nextRandom = nextRandom * 10 % 38>
                              </#list>
                          </@linkTag>              
                      </ul>
                    </article>
                    <article class="joe_detail__article">
                        <h5>申请格式</h5>
                        <div class="link-requirement">
                          <p>
                              <joe-message type="info" content="博客名称 + 博客地址 + 博客Logo + 博客介绍，在评论区留言即可。"></joe-message>
                          </p>
                          <blockquote class="joe_link__demo">博客名称：${blog_title!}<br>博客地址：<a href="${blog_url!}">${blog_url!}</a><br>博客介绍：${meta_description!}<br>博客Logo： <a href="${blog_logo!}">${blog_logo!}</a></blockquote>
                        </div>
                    </article>
                </div>
                <#--  <div class="joe_comment">
                    <@global.comment target=links type="links" />
                    <#assign commentType="post">
                    <#include "common/comment.ftl">
                </div>  -->
            </div>
            <#include "common/aside.ftl">
        </div>
        <#include "common/footer.ftl">
        <#include "common/tail.ftl">
    </div>
</body>
</html>