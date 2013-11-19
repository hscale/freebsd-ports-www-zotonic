--- ./deps/eiconv/test/eiconv_tests.erl.orig	2013-06-12 16:03:44.000000000 +0200
+++ ./deps/eiconv/test/eiconv_tests.erl	2013-11-19 20:45:34.000000000 +0100
@@ -12,17 +12,17 @@
 
 %% Some simple tests...
 ascii_to_utf8_test() ->
-    {ok, C} = eiconv:open("utf8", "ascii"),
+    {ok, C} = eiconv:open("utf-8", "ascii"),
     ?assertEqual(<<"123">>, conv(C, "123")),
     ?assertEqual(<<"123">>, conv(C, ["123"])),
     ?assertEqual(<<"123">>, conv(C, <<"123">>)).
 
 iso8859_15_to_utf8_test() ->
-    {ok, C} = eiconv:open("utf8", "iso8859-15"),
+    {ok, C} = eiconv:open("utf-8", "iso8859-15"),
     ?assertEqual([194, 163,  226, 130, 172,  194, 165], binary_to_list(conv(C, [163, 164, 165]))).
     
 utf8_to_iso8859_15_test() ->
-    {ok, C} = eiconv:open("iso8859-15", "utf8"),
+    {ok, C} = eiconv:open("iso8859-15", "utf-8"),
     ?assertEqual([163,  164, 165], binary_to_list(conv(C, [194, 163, 226, 130, 172, 194, 165]))).
 
 non_existing_codecs_test() ->
@@ -48,7 +48,7 @@
 %%stress_open_conv(0) ->
 %%    ok;
 %%stress_open_conv(N) ->
-%%    {ok, C} = eiconv:open("iso8859-15", "utf8"),
+%%    {ok, C} = eiconv:open("iso8859-15", "utf-8"),
 %%    [163,  164, 165] = binary_to_list(conv(C, [194, 163, 226, 130, 172, 194, 165])),
 %%    stress_open_conv(N-1).
 
