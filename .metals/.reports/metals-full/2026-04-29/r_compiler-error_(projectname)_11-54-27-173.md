error id: 191E9812D4F0009F6F0C69D83E52D7EB
file://<WORKSPACE>/hw/spinal/div.scala
### java.lang.IndexOutOfBoundsException: 14

occurred in the presentation compiler.



action parameters:
offset: 7
uri: file://<WORKSPACE>/hw/spinal/div.scala
text:
```scala
package@@

```


presentation compiler configuration:
Scala version: 2.13.14
Classpath:
<WORKSPACE>/.bloop/projectname/bloop-bsp-clients-classes/classes-Metals-k1GNn_kYTregln4HIeAmQg== [exists ], <HOME>/Library/Caches/bloop/semanticdb/com.sourcegraph.semanticdb-javac.0.11.2/semanticdb-javac-0.11.2.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.14/scala-library-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-core_2.13/1.12.3/spinalhdl-core_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-lib_2.13/1.12.3/spinalhdl-lib_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-idsl-plugin_2.13/1.12.3/spinalhdl-idsl-plugin_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-sim_2.13/1.12.3/spinalhdl-sim_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.13/3.2.10/scalactic_2.13-3.2.10.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.14/scala-reflect-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/scopt/scopt_2.13/4.1.0/scopt_2.13-4.1.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/sourcecode_2.13/0.3.0/sourcecode_2.13-0.3.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-compiler/2.13.14/scala-compiler-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-idsl-payload_2.13/1.12.3/spinalhdl-idsl-payload_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/openhft/affinity/3.23.2/affinity-3.23.2.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/slf4j/slf4j-simple/2.0.5/slf4j-simple-2.0.5.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/oshi/oshi-core/6.4.0/oshi-core-6.4.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/io/github/java-diff-utils/java-diff-utils/4.12/java-diff-utils-4.12.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/jline/jline/3.25.1/jline-3.25.1.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna/5.14.0/jna-5.14.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.5/slf4j-api-2.0.5.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna-platform/5.12.1/jna-platform-5.12.1.jar [exists ]
Options:
-Yrangepos -Xplugin-require:semanticdb




#### Error stacktrace:

```
scala.reflect.internal.util.BatchSourceFile.offsetToLine(SourceFile.scala:213)
	scala.meta.internal.pc.MetalsGlobal$XtensionPositionMetals.toPos(MetalsGlobal.scala:808)
	scala.meta.internal.pc.MetalsGlobal$XtensionPositionMetals.toLsp(MetalsGlobal.scala:821)
	scala.meta.internal.pc.PcDocumentHighlightProvider.collect(PcDocumentHighlightProvider.scala:21)
	scala.meta.internal.pc.PcDocumentHighlightProvider.collect(PcDocumentHighlightProvider.scala:9)
	scala.meta.internal.pc.PcCollector.scala$meta$internal$pc$PcCollector$$collect$1(PcCollector.scala:114)
	scala.meta.internal.pc.PcCollector.traverseWithParent$1(PcCollector.scala:184)
	scala.meta.internal.pc.PcCollector.traverseSought(PcCollector.scala:322)
	scala.meta.internal.pc.PcCollector.traverseSought$(PcCollector.scala:101)
	scala.meta.internal.pc.WithSymbolSearchCollector.traverseSought(PcCollector.scala:353)
	scala.meta.internal.pc.PcCollector.resultWithSought(PcCollector.scala:88)
	scala.meta.internal.pc.PcCollector.resultWithSought$(PcCollector.scala:17)
	scala.meta.internal.pc.WithSymbolSearchCollector.resultWithSought(PcCollector.scala:353)
	scala.meta.internal.pc.WithSymbolSearchCollector.$anonfun$result$1(PcCollector.scala:360)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.pc.WithSymbolSearchCollector.result(PcCollector.scala:360)
	scala.meta.internal.pc.PcDocumentHighlightProvider.highlights(PcDocumentHighlightProvider.scala:30)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$documentHighlight$1(ScalaPresentationCompiler.scala:527)
	scala.meta.internal.pc.CompilerAccess.retryWithCleanCompiler(CompilerAccess.scala:182)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withSharedCompiler$1(CompilerAccess.scala:155)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.pc.CompilerAccess.withSharedCompiler(CompilerAccess.scala:154)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withInterruptableCompiler$1(CompilerAccess.scala:92)
	scala.meta.internal.pc.CompilerAccess.$anonfun$onCompilerJobQueue$1(CompilerAccess.scala:209)
	scala.meta.internal.pc.CompilerJobQueue$Job.run(CompilerJobQueue.scala:152)
	java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
	java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	java.base/java.lang.Thread.run(Thread.java:1583)
```
#### Short summary: 

java.lang.IndexOutOfBoundsException: 14