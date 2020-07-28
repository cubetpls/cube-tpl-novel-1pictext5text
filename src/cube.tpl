<div class="wrapper" c-hide={{list.length == 0}}>
   <ul class="serial-list">
      {{#list list as item by item_index}}
      <li class="item gclearfix {{item_index === hover ? 'hover' : ''}} {{item_index === 0 ? 'item-special' : ''}}">
         <div class="index">{{item_index + 1}}</div>
         <div class="image-text">
            <a href="{{item.link}}">
               <div class="image">
                  <img src="{{item.images|clipImage: '162_90_'}}" on-error="this.onerror=null; this.src='https://hao2.qhimg.com/t01aa5080fbf6ae879b.png'" alt="">
                  <span class="update" r-html="{{item.update}}"></span>
               </div>
            </a>
            <div class="image-right">
               <div class="title {{item.special_cls}}"><a href="{{item.link}}">{{item.title}}</a></div>
               <div class="author">作者：{{item.author}}</div>
               <div class="tags">
                  {{#list item.tags as tag by tag_index}}
                  <span class="tag">{{tag.name}}</span>
                  {{/list}}
               </div>
            </div>
         </div>
         <div class="only-text {{item.special_cls}}">
            <a href="{{item.link}}" class="title">{{item.title}}</a>
            <i class="tag" c-show={{item.tags.length > 0}}>{{item.tags[0].name}}</i>
            <span class="update" r-html="{{item.update}}"></span>
         </div>
      </li>
      {{/list}}
   </ul>
</div>
<img src="assets/launchimg.png" c-show={{list.length == 0}} alt="">