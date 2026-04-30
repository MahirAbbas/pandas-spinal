error id: ECBE7A26CC5DA13485444A8C2C9A1B2B
file://<WORKSPACE>/hw/spinal/calc.scala
### java.lang.IndexOutOfBoundsException: -1 is out of bounds (min 0, max 2)

occurred in the presentation compiler.



action parameters:
uri: file://<WORKSPACE>/hw/spinal/calc.scala
text:
```scala
package pandasSpinal.calc

import spinal.core._
import spinal.lib._

class calc() extends Component {
  val io = new Bundle {
    val a, b, c, d = in port Bits(32 bits)
    val out_o = out port Bits(32 bits)
    val TYPEA, TYPEB,TYPEC, TYPED, SHIFT = in port Bits(32 bits)
  }

  def convert(data: Bits, negate: Bool): SInt = {
    val resized = SInt(34 bits)
    resized := data.resized(34).asSInt
    when(negate) {
      resized := -resized
    }
    resized
  }
  
  //val inpa_in, inpb_in, inpc_in, inpd_in = SInt(34 bits) init 0
  //val calculation = Bits(35 bits) init 0

  //inpa_in := convert(io.a, io.TYPEA(0))
  //Seq(inpa_in, inpb_in, inpc_in, inpd_in).foreach(e => e:= )
  val inputs : Ve = Vector(SInt(34 bits) init 0, 4)
  val ios = Vector(io.a, io.b, io.c, io.d)
  val types = Vector(io.TYPEA, io.TYPEB, io.TYPEC, io.TYPED)
  //inputs.zip(ios).zip(types).foreach((inp, i) => inp := convert(i, ))
  //(inputs, ios, types).zipped.toList.foreach((input, io, typ) => input := convert(io, typ(0)))
  (inputs, ios, types).zipped.toList.foreach{case(input: SInt, io, typ) => input := convert(io, typ(0))}
  


}

```


presentation compiler configuration:
Scala version: 2.13.14
Classpath:
<WORKSPACE>/.bloop/projectname/bloop-bsp-clients-classes/classes-Metals-ge3Hl4Q-Rfm38yXVLAZDrA== [exists ], <HOME>/Library/Caches/bloop/semanticdb/com.sourcegraph.semanticdb-javac.0.11.2/semanticdb-javac-0.11.2.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.14/scala-library-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-core_2.13/1.12.3/spinalhdl-core_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-lib_2.13/1.12.3/spinalhdl-lib_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-idsl-plugin_2.13/1.12.3/spinalhdl-idsl-plugin_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-sim_2.13/1.12.3/spinalhdl-sim_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.13/3.2.10/scalactic_2.13-3.2.10.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.14/scala-reflect-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/scopt/scopt_2.13/4.1.0/scopt_2.13-4.1.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/sourcecode_2.13/0.3.0/sourcecode_2.13-0.3.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-compiler/2.13.14/scala-compiler-2.13.14.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/spinalhdl/spinalhdl-idsl-payload_2.13/1.12.3/spinalhdl-idsl-payload_2.13-1.12.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/openhft/affinity/3.23.2/affinity-3.23.2.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/slf4j/slf4j-simple/2.0.5/slf4j-simple-2.0.5.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/com/github/oshi/oshi-core/6.4.0/oshi-core-6.4.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/io/github/java-diff-utils/java-diff-utils/4.12/java-diff-utils-4.12.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/jline/jline/3.25.1/jline-3.25.1.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna/5.14.0/jna-5.14.0.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.5/slf4j-api-2.0.5.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna-platform/5.12.1/jna-platform-5.12.1.jar [exists ]
Options:
-Yrangepos -Xplugin-require:semanticdb




#### Error stacktrace:

```
scala.collection.mutable.ArrayBuffer.apply(ArrayBuffer.scala:102)
	scala.reflect.internal.Types$Type.findMemberInternal$1(Types.scala:1030)
	scala.reflect.internal.Types$Type.findMember(Types.scala:1035)
	scala.reflect.internal.Types$Type.memberBasedOnName(Types.scala:661)
	scala.reflect.internal.Types$Type.nonLocalMember(Types.scala:652)
	scala.tools.nsc.typechecker.Contexts$ImportInfo.importedSelectedSymbol(Contexts.scala:1944)
	scala.tools.nsc.typechecker.Contexts$ImportInfo.importedSymbol(Contexts.scala:1921)
	scala.tools.nsc.typechecker.Contexts$Context.scala$tools$nsc$typechecker$Contexts$$resolveAmbiguousImport(Contexts.scala:1207)
	scala.tools.nsc.typechecker.Contexts$SymbolLookup.apply(Contexts.scala:1688)
	scala.tools.nsc.typechecker.Contexts$Context.lookupSymbol(Contexts.scala:1282)
	scala.tools.nsc.typechecker.Typers$Typer.typedIdent$2(Typers.scala:5663)
	scala.tools.nsc.typechecker.Typers$Typer.typedIdentOrWildcard$1(Typers.scala:5732)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6203)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedSelectOrSuperCall$1(Typers.scala:6359)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6206)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typed1$41(Typers.scala:5233)
	scala.tools.nsc.typechecker.Typers$Typer.silent(Typers.scala:713)
	scala.tools.nsc.typechecker.Typers$Typer.normalTypedApply$1(Typers.scala:5235)
	scala.tools.nsc.typechecker.Typers$Typer.typedApply$1(Typers.scala:5267)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6205)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.computeType(Typers.scala:6350)
	scala.tools.nsc.typechecker.Namers$Namer.assignTypeToTree(Namers.scala:1105)
	scala.tools.nsc.typechecker.Namers$Namer.inferredValTpt$1(Namers.scala:1752)
	scala.tools.nsc.typechecker.Namers$Namer.valDefSig(Namers.scala:1765)
	scala.tools.nsc.typechecker.Namers$Namer.memberSig(Namers.scala:1953)
	scala.tools.nsc.typechecker.Namers$Namer.typeSig(Namers.scala:1903)
	scala.tools.nsc.typechecker.Namers$Namer$ValTypeCompleter.completeImpl(Namers.scala:918)
	scala.tools.nsc.typechecker.Namers$Namer$AccessorTypeCompleter.completeImpl(Namers.scala:942)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete(Namers.scala:2100)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete$(Namers.scala:2098)
	scala.tools.nsc.typechecker.Namers$TypeCompleterBase.complete(Namers.scala:2093)
	scala.reflect.internal.Symbols$Symbol.completeInfo(Symbols.scala:1566)
	scala.reflect.internal.Symbols$Symbol.info(Symbols.scala:1538)
	scala.reflect.internal.Symbols$Symbol.tpe_$times(Symbols.scala:1521)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedBlock$2(Typers.scala:2635)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedBlock$2$adapted(Typers.scala:2633)
	scala.collection.immutable.List.exists(List.scala:396)
	scala.tools.nsc.typechecker.Typers$Typer.matchesVisibleMember$1(Typers.scala:2633)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedBlock$3(Typers.scala:2643)
	scala.reflect.internal.Scopes$Scope.foreach(Scopes.scala:455)
	scala.tools.nsc.typechecker.Typers$Typer.typedBlock(Typers.scala:2639)
	scala.tools.nsc.typechecker.Typers$Typer.typedOutsidePatternMode$1(Typers.scala:6179)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6215)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.computeType(Typers.scala:6350)
	scala.tools.nsc.typechecker.Namers$Namer.assignTypeToTree(Namers.scala:1105)
	scala.tools.nsc.typechecker.Namers$Namer.inferredValTpt$1(Namers.scala:1752)
	scala.tools.nsc.typechecker.Namers$Namer.valDefSig(Namers.scala:1765)
	scala.tools.nsc.typechecker.Namers$Namer.memberSig(Namers.scala:1953)
	scala.tools.nsc.typechecker.Namers$Namer.typeSig(Namers.scala:1903)
	scala.tools.nsc.typechecker.Namers$Namer$ValTypeCompleter.completeImpl(Namers.scala:918)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete(Namers.scala:2100)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete$(Namers.scala:2098)
	scala.tools.nsc.typechecker.Namers$TypeCompleterBase.complete(Namers.scala:2093)
	scala.reflect.internal.Symbols$Symbol.completeInfo(Symbols.scala:1566)
	scala.reflect.internal.Symbols$Symbol.info(Symbols.scala:1538)
	scala.reflect.internal.Symbols$Symbol.initialize(Symbols.scala:1733)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5835)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$9(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedTemplate(Typers.scala:2144)
	scala.tools.nsc.typechecker.Typers$Typer.typedClassDef(Typers.scala:1982)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6168)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$9(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedPackageDef$1(Typers.scala:5844)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6171)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Analyzer$typerFactory$TyperPhase.apply(Analyzer.scala:125)
	scala.tools.nsc.Global$GlobalPhase.applyPhase(Global.scala:481)
	scala.tools.nsc.interactive.Global$TyperRun.applyPhase(Global.scala:1369)
	scala.tools.nsc.interactive.Global$TyperRun.typeCheck(Global.scala:1362)
	scala.tools.nsc.interactive.Global.typeCheck(Global.scala:680)
	scala.meta.internal.pc.WithCompilationUnit.<init>(WithCompilationUnit.scala:24)
	scala.meta.internal.pc.SimpleCollector.<init>(PcCollector.scala:348)
	scala.meta.internal.pc.PcSemanticTokensProvider$Collector$.<init>(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector$lzycompute$1(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.provide(PcSemanticTokensProvider.scala:73)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticTokens$1(ScalaPresentationCompiler.scala:207)
	scala.meta.internal.pc.CompilerAccess.withSharedCompiler(CompilerAccess.scala:148)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withInterruptableCompiler$1(CompilerAccess.scala:92)
	scala.meta.internal.pc.CompilerAccess.$anonfun$onCompilerJobQueue$1(CompilerAccess.scala:209)
	scala.meta.internal.pc.CompilerJobQueue$Job.run(CompilerJobQueue.scala:152)
	java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
	java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	java.base/java.lang.Thread.run(Thread.java:1583)
```
#### Short summary: 

java.lang.IndexOutOfBoundsException: -1 is out of bounds (min 0, max 2)