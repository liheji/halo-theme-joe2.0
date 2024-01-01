<#if settings.enable_aside>
  <aside class="joe_aside${(settings.aside_position=='left')?then(' pos_left','')}">
    <#if settings.show_blogger!true>
      <#include "../module/blogger.ftl">
    </#if>
    <#if settings.enable_notice && settings.site_notice??>
      <section class="joe_aside__item notice">
        <div class="joe_aside__item-title">
          <#--  <i class="joe-font joe-icon-speaker"></i>  -->
          <#include "../module/speaker.ftl">
          <span class="text">公告信息</span>
        </div>
        <div class="joe_aside__item-contain">
          <div class="notice_content">${settings.site_notice!}</div>
        </div>
      </section>
    </#if>
    <#if settings.enable_qrcode && settings.qrcode_url?? && settings.qrcode_url!=''>
      <section class="joe_aside__item qrcode">
        <div class="joe_aside__item-title">
          <i class="joe-font joe-icon-qrcode"></i>
          <span class="text">${settings.qrcode_title!'我的二维码'}</span>
        </div>
        <div class="joe_aside__item-contain">
          <img class="qrcode_img lazyload" src="${LAZY_IMG}" data-src="${settings.qrcode_url!}" onerror="Joe.errorImg(this)" alt="二维码"/>
          <#if settings.qrcode_description??>
            <p class="qrcode_description">${settings.qrcode_description!}</p>
          </#if>
        </div>
      </section>
    </#if>
    <#if settings.enable_newest_post!true>
      <#import "../macro/latest.ftl" as np>
      <@np.newest/>
    </#if>
    <#if settings.enable_visit!true>
      <section class="joe_aside__item visit">
        <div class="joe_aside__item-title">
          <i class="joe-font joe-icon-eye"></i>
          <span class="text">访客信息</span>
        </div>
        <div class="joe_aside__item-contain">
          <div class="item"><span>欢迎来自</span><span id="visit_city">-</span><span>的朋友</span></div>
          <div class="item"><span>不期而遇，你是第</span><span id="visit_view">-</span><span>位</span></div>
          <div class="item"><span>您的IP是</span><span id="visit_ip">-</span></div>
          <div class="item"><span>你的浏览器是</span><span id="visit_browser">-</span></div>
          <div class="item"><span>你的操作系统是</span><span id="visit_operate">-</span></div>
        </div>
      </section>
      <style>.joe_aside__item.visit{color:var(--minor);background:var(--background);}.joe_aside__item.visit .joe_aside__item-contain .item{font-size:15px;line-height:26px;}.joe_aside__item.visit .joe_aside__item-contain .item span:nth-child(2){color:var(--theme);margin:5px;font-size:16px;}</style>
      <#if settings.cdn_type=='none'>
        <script src="https://cdn.jsdelivr.net/npm/ua-parser-js@1.0.35/src/ua-parser.min.js"></script>
      <#else>
        <script src="${settings.custom_cdn_url}/npm/ua-parser-js@1.0.35/src/ua-parser.min.js"></script>
      </#if>
      <script>window.VISIT_75905460=(data)=>{window.addEventListener('load',()=>{document.getElementById("visit_ip").innerHTML=data.ip;document.getElementById("visit_view").innerHTML=document.getElementById("busuanzi_value_site_uv").innerText;let from=data.data.city;if(from==null||from.trim()===""){from=data.data.prov}if(from==null||from.trim()===""){from=data.data.owner}document.getElementById("visit_city").innerHTML=from;const parser=new UAParser();const os=parser.getOS();const browser=parser.getBrowser();document.getElementById("visit_browser").innerHTML=browser.name+" "+browser.major;document.getElementById("visit_operate").innerHTML=os.name+" "+os.version})}</script>
      <script async src="https://api.liheji.top/ip.php?jsonpCallback=VISIT_75905460"></script>
    </#if>
    <#if settings.enable_lifetime!true>
      <section class="joe_aside__item timelife">
        <div class="joe_aside__item-title">
          <i class="joe-font joe-icon-shalou"></i>
          <span class="text">人生倒计时</span>
        </div>
        <div class="joe_aside__item-contain"></div>
      </section>
    </#if>
    <#if settings.enable_clean_mode!=true && settings.show_newreply==true>
      <section class="joe_aside__item newreply">
        <div class="joe_aside__item-title">
          <i class="joe-font joe-icon-message"></i>
          <span class="text">最新回复</span>
        </div>
        <@commentTag method="latest" top='${settings.newreply_page_size!5}'>
          <#if comments.content?size gt 0>
            <ul class="joe_aside__item-contain">
              <#list comments.content as comment>
                <li class="item">
                  <div class="user">
                    <#assign avatar=(comment.avatar?? && comment.avatar!='')?then(comment.avatar,settings.default_avatar!)>
                    <img width="35" height="35" class="avatar lazyload" data-src="${avatar}" src="${settings.lazyload_avatar!}" onerror="Joe.errorImg(this)" alt="头像">
                    <div class="info">
                      <div class="author">${comment.author!}</div>
                      <span class="date">${comment.createTime?string("yyyy-MM-dd")}</span>
                    </div>
                  </div>
                  <div class="reply">
                    <#assign tmp = comment.post.fullPath?ends_with('/')?then(comment.post.fullPath?replace('/$','','ri'), comment.post.fullPath)>
                    <#assign basePath = (tmp?index_of('?')!=-1)?then(tmp + '&', tmp + '?')>
                    <a class="link aside-reply-content" href="${basePath}cid=${comment.id?c}">${comment.content!}</a>
                  </div>
                </li>
              </#list>
            </ul>
          <#else>
            <#include "../macro/empty.ftl">
            <@empty type="aside" showImg="false" mini="true" />
          </#if>
        </@commentTag>
      </section>
    </#if>
    <#if settings.enable_tag_cloud!true>
      <section class="joe_aside__item tags-cloud">
        <div class="joe_aside__item-title">
          <i class="joe-font joe-icon-tag"></i>
          <span class="text">标签云</span>
          <#if tags?size gt settings.tag_cloud_max?default(18)?number><a class="tags_more" href="${blog_url!}/tags">更多<i class="joe-font joe-icon-more-right"></i></a></#if>
        </div>
        <div class="joe_aside__item-contain">
          <@tagTag method="list">
            <#if tags?size gt 0>
              <div class="tags-cloud-list${(settings.tag_cloud_width=='responsive')?then(' responsive','')}"${(settings.tag_cloud_type=='3d')?then(' style="display:none;"','')}>
                <#list tags as tag>
                  <#if tag_index lt settings.tag_cloud_max?default(18)?number>
                    <a data-url="${tag.fullPath!}" data-label="${tag.name!}" href="${tag.fullPath!}" title="${tag.name!}">${tag.name!}</a>
                  </#if>
                </#list>
              </div>
              <#if settings.tag_cloud_type=='3d'>
                <div id="tags-3d">
                  <div class="empty">加载中…</div>
                </div>
              </#if>
            <#else>
              <div class="empty">暂无标签</div>
            </#if>
          </@tagTag>
        </div>
      </section>
    </#if>
    <#if settings.enable_clean_mode!=true && settings.enable_aside_ads==true>
      <#include "../ads/ads_aside.ftl">
    </#if>
  </aside>
</#if>