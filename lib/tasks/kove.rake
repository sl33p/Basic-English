#encoding: utf-8 
require 'net/http'
require 'htmlentities'
require 'cgi'

  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper

namespace :kove  do

 
  
  desc "picks a random sentence from Ogden's Basic English vocabularly and searches google for it, returning the first paragraph, then tweets it"
  task :basicenglish => :environment do
  
  Twitter.configure do |config|

        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.oauth_token = ENV["OAUTH_TOKEN"]
        config.oauth_token_secret = ENV["OAUTH_TOKEN_SECRET"]
  end
  
    puts "Searching for:"
     vocabulary = ["a","able","about","account","acid","across","act","addition","adjustment","advertisement","after","again","against","agreement","air","all","almost","among","amount","amusement","and","angle","angry","animal","answer","ant","any","apparatus","apple","approval","arch","argument","arm","army","art","as","at","attack","attempt","attention","attraction","authority","automatic","awake","baby","back","bad","bag","balance","ball","band","base","basin","basket","bath","be","beautiful","because","bed","bee","before","behaviour","belief","bell","bent","berry","between","bird","birth","bit","bite","bitter","black","blade","blood","blow","blue","board","boat","body","boiling","bone","book","boot","bottle","box","boy","brain","brake","branch","brass","bread","breath","brick","bridge","bright","broken","brother","brown","brush","bucket","building","bulb","burn","burst","business","but","butter","button","by","cake","camera","canvas","card","care","carriage","cart","cat","cause","certain","chain","chalk","chance","change","cheap","cheese","chemical","chest","chief","chin","church","circle","clean","clear","clock","cloth","cloud","coal","coat","cold","collar","colour","comb","come","comfort","committee","common","company","comparison","competition","complete","complex","condition","connection","conscious","control","cook","copper","copy","cord","cork","cotton","cough","country","cover","cow","crack","credit","crime","cruel","crush","cry","cup","cup","current","curtain","curve","cushion","damage","danger","dark","daughter","day","dead","dear","death","debt","decision","deep","degree","delicate","dependent","design","desire","destruction","detail","development","different","digestion","direction","dirty","discovery","discussion","disease","disgust","distance","distribution","division","do","dog","door","doubt","down","drain","drawer","dress","drink","driving","drop","dry","dust","ear","early","earth","east","edge","education","effect","egg","elastic","electric","end","engine","enough","equal","error","even","event","ever","every","example","exchange","existence","expansion","experience","expert","eye","face","fact","fall","false","family","far","farm","fat","father","fear","feather","feeble","feeling","female","fertile","fiction","field","fight","finger","fire","first","fish","fixed","flag","flame","flat","flight","floor","flower","fly","fold","food","foolish","foot","for","force","fork","form","forward","fowl","frame","free","frequent","friend","from","front","fruit","full","future","garden","general","get","girl","give","glass","glove","go","goat","gold","good","government","grain","grass","great","green","grey","grip","group","growth","guide","gun","hair","hammer","hand","hanging","happy","harbour","hard","harmony","hat","hate","have","he","head","healthy","hear","hearing","heart","heat","help","high","history","hole","hollow","hook","hope","horn","horse","hospital","hour","house","how","humour","I","ice","idea","if","ill","important","impulse","in","increase","industry","ink","insect","instrument","insurance","interest","invention","iron","island","jelly","jewel","join","journey","judge","jump","keep","kettle","key","kick","kind","kiss","knee","knife","knot","knowledge","land","language","last","late","laugh","law","lead","leaf","learning","leather","left","leg","let","letter","level","library","lift","light","like","limit","line","linen","lip","liquid","list","little","living","lock","long","look","loose","loss","loud","love","low","machine","make","male","man","manager","map","mark","market","married","mass","match","material","may","meal","measure","meat","medical","meeting","memory","metal","middle","military","milk","mind","mine","minute","mist","mixed","money","monkey","month","moon","morning","mother","motion","mountain","mouth","move","much","muscle","music","nail","name","narrow","nation","natural","near","necessary","neck","need","needle","nerve","net","new","news","night","no","noise","normal","north","nose","not","note","now","number","nut","observation","of","off","offer","office","oil","old","on","only","open","operation","opinion","opposite","or","orange","order","organization","ornament","other","out","oven","over","owner","page","pain","paint","paper","parallel","parcel","part","past","paste","payment","peace","pen","pencil","person","physical","picture","pig","pin","pipe","place","plane","plant","plate","play","please","pleasure","plough","pocket","point","poison","polish","political","poor","porter","position","possible","pot","potato","powder","power","present","price","print","prison","private","probable","process","produce","profit","property","prose","protest","public","pull","pump","punishment","purpose","push","put","quality","question","quick","quiet","quite","rail","rain","range","rat","rate","ray","reaction","reading","ready","reason","receipt","record","red","regret","regular","relation","religion","representative","request","respect","responsible","rest","reward","rhythm","rice","right","ring","river","road","rod","roll","roof","room","root","rough","round","rub","rule","run","sad","safe","sail","salt","same","sand","say","scale","school","science","scissors","screw","sea","seat","second","secret","secretary","see","seed","seem","selection","self","send","sense","separate","serious","servant","sex","shade","shake","shame","sharp","sheep","shelf","ship","shirt","shock","shoe","short","shut","side","sign","silk","silver","simple","sister","size","skin","skirt","sky","sleep","slip","slope","slow","small","smash","smell","smile","smoke","smooth","snake","sneeze","snow","so","soap","society","sock","soft","solid","some","son","song","sort","sound","soup","south","space","spade","special","sponge","spoon","spring","square","stage","stamp","star","start","statement","station","steam","steel","stem","step","stick","sticky","stiff","still","stitch","stocking","stomach","stone","stop","store","story","straight","strange","street","stretch","strong","structure","substance","such","sudden","sugar","suggestion","summer","sun","support","surprise","sweet","swim","system","table","tail","take","talk","tall","taste","tax","teaching","tendency","test","than","that","the","then","theory","there","thick","thin","thing","this","thought","thread","throat","through","through","thumb","thunder","ticket","tight","till","time","tin","tired","to","toe","together","tomorrow","tongue","tooth","top","touch","town","trade","train","transport","tray","tree","trick","trouble","trousers","true","turn","twist","umbrella","under","unit","up","use","value","verse","very","vessel","view","violent","voice","waiting","walk","wall","war","warm","wash","waste","watch","water","wave","wax","way","weather","week","weight","well","west","wet","wheel","when","where","while","whip","whistle","white","who","why","wide","will","wind","window","wine","wing","winter","wire","wise","with","woman","wood","wool","word","work","worm","wound","writing","wrong","year","yellow","yes","yesterday","you","young"]

  arr_length = vocabulary.length
  search_str = ''

  6.times do
    search_str =  search_str + vocabulary[rand(arr_length)] + "%20"
  end
  
  puts search_str.gsub('%20',' ')
  puts "Found a site?"
  search_url = URI.parse("http://www.google.com/search?hl=en&q="+search_str+"&btnI=I%27m+Feeling+Lucky")
  #get the url
  puts "Searching #{search_url}"

  html_response = RestClient.get("http://www.google.com/search?hl=en&q="+search_str+"&btnI=I%27m+Feeling+Lucky")
  
  if !html_response
    puts "No HTML returned"
  else
  
  puts "converting"
  utf8_response = html_response.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  
  puts "searching for a paragraph"
  paragraph_array = utf8_response.scan(/<p>.*<\/p>/)
  if  paragraph_array[0].nil? 
  puts "no paragraph found"
  else
  stripped_paragraph =  CGI.unescapeHTML(paragraph_array[0].to_str)
  # removing wikipedia references[1]
  stripped_paragraph = stripped_paragraph.gsub(/\[[1-9]\]/) { '' }   
  # changing quotes back to text, etc.
  stripped_paragraph = HTMLEntities.new.decode stripped_paragraph
  #stripped_paragraph = CGI.unescapeHTML(stripped_paragraph)

  puts "----------------------------------------------------"
  puts "stripping p-tags"  
  puts stripped_paragraph
  puts "----------------------------------------------------"
  puts "preparing tweet" 
  puts stripped_paragraph = truncate(strip_tags(stripped_paragraph),:length=>139, :separator => ' ',:omission => '.').html_safe
  
  puts "----------------------------------------------------"
  # remove URLs (most of them)
  stripped_paragraph = stripped_paragraph.gsub(/https?:\/\/[\S]+/) { '' } 
  #remove last sentence 
  stripped_paragraph = stripped_paragraph.gsub(/\.[^\.]+\.?$/, '.')
#remove two dots
  stripped_pararagraph = stripped_paragraph.gsub('..','.')
  puts stripped_paragraph
  
    if stripped_paragraph.length > 3 
      if not  stripped_paragraph.include? "scorecardresearch" # @fixme
      Twitter.update(stripped_paragraph.to_str)
      puts "tweet sent"
    end  
    end
  
  end
  end
  
  
  end
  
  
  task :test do
#    paragraph = "Commando (first released on October 4th, 1985) &nbsp;is a Hollywood action movie[1] starring&#39; Arnold Schwarzenegger. It is still enjoyed today on."
paragraph = "New Zealand in firm control of first Sri Lanka Test http://www.arabtoday.net//new-zealand-in-firm-control-of-fNew Zealand&#39;s Trent BoultNew."
    puts paragraph
  paragraph = paragraph.gsub(/https?:\/\/[\S]+/) { ' ' } 
 
     puts "----------------------------------------------------"
     puts CGI.unescapeHTML(paragraph)
  end

  task :graphics do
        (1..32).each do |i|
      print "\n"
      (1..32).each do |j|
          print rand(1..2)==1 ? "•" : " "
      end
    end
  end
  
  
  task :info do
    (1..18).each do |i|
      print "\n"
      (1..42).each do |j|
          print rand(32..127).chr
      end
    end
    print " recons.tructed"
  end  


end
