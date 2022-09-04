import 'package:dio/dio.dart';
import 'package:schedulex_flutter/pages/import/jw_import/jw_import_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// js解析器
///
///

Dio dio = Dio()..interceptors.add(LogInterceptor());

/// 获取解析器并执行，返回执行结果，如果解析失败返回null
Future<String?> runParse(WebViewController? webViewController, String url,
    void Function(String) error) async {
  // 请求网络获取js源
  Response? res;
  try {
    res = await dio.get(url);
    // 获取到之后直接执行定义好的方法，如果成功则返回解析后的json str
    return await webViewController?.runJavascriptReturningResult("""
     ${res.data}
     parser();
    """);
  } catch (e) {
    error.call(e.toString());
  }
  return null;
}

/// 注入解析器资源包
injectParserSource(
  WebViewController? webViewController,
) async {
  try {
    // 注入jq
    dio.get("${baseParseSource}jquery-3.6.0.min.js").then((value) {
      if (value.data != null) {
        webViewController?.runJavascriptReturningResult(value.data as String);
      }
    });
  } catch (ignore) {}
}

Future<String?>? getHtmlSource(WebViewController? webViewController) {
  // todo
  String js =
      "javascript:var ifrs=document.getElementsByTagName(\"iframe\");var iframeContent=\"\";for(var i=0;i<ifrs.length;i++){iframeContent=iframeContent+ifrs[i].contentDocument.body.parentElement.outerHTML;}\nvar frs=document.getElementsByTagName(\"frame\");var frameContent=\"\";for(var i=0;i<frs.length;i++){frameContent=frameContent+frs[i].contentDocument.body.parentElement.outerHTML;}\nwindow.local_obj.showSource(document.getElementsByTagName('html')[0].innerHTML + iframeContent + frameContent);";
  try {
    return webViewController?.runJavascriptReturningResult(js);
  } catch (ignore) {}
  return Future.value(null);
}
