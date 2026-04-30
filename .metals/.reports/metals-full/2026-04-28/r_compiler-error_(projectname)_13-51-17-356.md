error id: 32607C3BFA50BF91901504C4BC8BAFA9
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
  val inputs : Vector[SInt] = Vector(SInt(34 bits) init 0, 4)
  val ios : Vect= Vector(io.a, io.b, io.c, io.d)
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
	scala.reflect.internal.Types$Type.nonPrivateMember(Types.scala:632)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.$anonfun$checkCompatibility$1(Implicits.scala:774)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.$anonfun$checkCompatibility$1$adapted(Implicits.scala:774)
	scala.collection.IterableOnceOps.exists(IterableOnce.scala:647)
	scala.collection.IterableOnceOps.exists$(IterableOnce.scala:644)
	scala.collection.AbstractIterator.exists(Iterator.scala:1303)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.loop$3(Implicits.scala:774)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.checkCompatibility(Implicits.scala:780)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.normSubType(Implicits.scala:480)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.matchesPt(Implicits.scala:664)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.typedImplicit1(Implicits.scala:908)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.typedImplicit0(Implicits.scala:824)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.scala$tools$nsc$typechecker$Implicits$ImplicitSearch$$typedImplicit(Implicits.scala:639)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch$ImplicitComputation.rankImplicits(Implicits.scala:1219)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch$ImplicitComputation.findBest(Implicits.scala:1260)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.searchImplicit(Implicits.scala:1319)
	scala.tools.nsc.typechecker.Implicits$ImplicitSearch.bestImplicit(Implicits.scala:1716)
	scala.tools.nsc.typechecker.Implicits.inferImplicit1(Implicits.scala:112)
	scala.tools.nsc.typechecker.Implicits.inferImplicit(Implicits.scala:91)
	scala.tools.nsc.typechecker.Implicits.inferImplicit$(Implicits.scala:88)
	scala.meta.internal.pc.MetalsGlobal$MetalsInteractiveAnalyzer.inferImplicit(MetalsGlobal.scala:85)
	scala.tools.nsc.typechecker.Implicits.inferImplicitView(Implicits.scala:50)
	scala.tools.nsc.typechecker.Implicits.inferImplicitView$(Implicits.scala:49)
	scala.meta.internal.pc.MetalsGlobal$MetalsInteractiveAnalyzer.inferImplicitView(MetalsGlobal.scala:85)
	scala.tools.nsc.typechecker.Typers$Typer.inferView(Typers.scala:332)
	scala.tools.nsc.typechecker.Typers$Typer.adaptToMember(Typers.scala:1416)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$adaptToMemberWithArgs$6(Typers.scala:1469)
	scala.tools.nsc.typechecker.Typers$Typer.silent(Typers.scala:727)
	scala.tools.nsc.typechecker.Typers$Typer.adaptToMemberWithArgs(Typers.scala:1469)
	scala.tools.nsc.typechecker.Typers$Typer.typedSelect$1(Typers.scala:5454)
	scala.tools.nsc.typechecker.Typers$Typer.typedSelectOrSuperCall$1(Typers.scala:5604)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6206)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedArg(Typers.scala:3557)
	scala.tools.nsc.typechecker.Typers$Typer.typedArg0$1(Typers.scala:3665)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$doTypedApply$7(Typers.scala:3684)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$doTypedApply$6(Typers.scala:3663)
	scala.tools.nsc.typechecker.Contexts$Context.savingUndeterminedTypeParams(Contexts.scala:546)
	scala.tools.nsc.typechecker.Typers$Typer.handleOverloaded$1(Typers.scala:3660)
	scala.tools.nsc.typechecker.Typers$Typer.doTypedApply(Typers.scala:3712)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typed1$28(Typers.scala:5166)
	scala.tools.nsc.typechecker.Typers$Typer.silent(Typers.scala:727)
	scala.tools.nsc.typechecker.Typers$Typer.tryTypedApply$1(Typers.scala:5166)
	scala.tools.nsc.typechecker.Typers$Typer.normalTypedApply$1(Typers.scala:5254)
	scala.tools.nsc.typechecker.Typers$Typer.typedApply$1(Typers.scala:5267)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6205)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedArg(Typers.scala:3557)
	scala.tools.nsc.typechecker.Typers$Typer.typedArg0$1(Typers.scala:3665)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$doTypedApply$7(Typers.scala:3684)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$doTypedApply$6(Typers.scala:3663)
	scala.tools.nsc.typechecker.Contexts$Context.savingUndeterminedTypeParams(Contexts.scala:546)
	scala.tools.nsc.typechecker.Typers$Typer.handleOverloaded$1(Typers.scala:3660)
	scala.tools.nsc.typechecker.Typers$Typer.doTypedApply(Typers.scala:3712)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typed1$28(Typers.scala:5166)
	scala.tools.nsc.typechecker.Typers$Typer.silent(Typers.scala:713)
	scala.tools.nsc.typechecker.Typers$Typer.tryTypedApply$1(Typers.scala:5166)
	scala.tools.nsc.typechecker.Typers$Typer.normalTypedApply$1(Typers.scala:5254)
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
	scala.meta.internal.pc.Compat.$anonfun$runOutline$1(Compat.scala:74)
	scala.collection.IterableOnceOps.foreach(IterableOnce.scala:619)
	scala.collection.IterableOnceOps.foreach$(IterableOnce.scala:617)
	scala.collection.AbstractIterable.foreach(Iterable.scala:935)
	scala.meta.internal.pc.Compat.runOutline(Compat.scala:66)
	scala.meta.internal.pc.Compat.runOutline(Compat.scala:35)
	scala.meta.internal.pc.Compat.runOutline$(Compat.scala:33)
	scala.meta.internal.pc.MetalsGlobal.runOutline(MetalsGlobal.scala:39)
	scala.meta.internal.pc.ScalaCompilerWrapper.compiler(ScalaCompilerAccess.scala:18)
	scala.meta.internal.pc.ScalaCompilerWrapper.compiler(ScalaCompilerAccess.scala:13)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticTokens$1(ScalaPresentationCompiler.scala:206)
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