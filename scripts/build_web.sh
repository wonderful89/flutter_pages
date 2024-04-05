
export ipa_Ver="1.0.0"
#ipa_Build=1
export ipa_Build=`git rev-list HEAD | wc -l | awk '$1=$1'` # 后面是移除空格

echo ipa_Ver=$ipa_Ver
echo ipa_Build=$ipa_Build

flutter build web --base-href /flutter_pages/ --release --web-renderer auto --build-name ${ipa_Ver} --build-number ${ipa_Build}

#flutter build web --release --build-name ${ipa_Ver} --build-number ${ipa_Build} --web-renderer auto
#dart "./scripts/dart/web_handle.dart"

#copyResourcesToWeb

# 复制到web server
copyResourcesToWeb(){
  appWebDir2="web_dist"
  if [ -d $appWebDir2 ]
  then
    rm -rf $appWebDir2
  fi
  mkdir $appWebDir2
  cp -r build/web/*  $appWebDir2
}
copyResourcesToWeb

