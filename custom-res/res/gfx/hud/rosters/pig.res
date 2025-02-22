Haven Resource 18 src '  Pig.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Pig extends Entry {
    public int meat, milk;
    public int meatq, milkq, hideq;
    public int seedq;
    public int prc;
    public boolean hog, piglet, dead, pregnant;

    public Pig(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, PigRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, PigRoster.cols.get(i), 0.5, hog,      sex, i++);
	drawcol(g, PigRoster.cols.get(i), 0.5, piglet,   growth, i++);
	drawcol(g, PigRoster.cols.get(i), 0.5, dead,     deadrend, i++);
	drawcol(g, PigRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, PigRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, PigRoster.cols.get(i), 1, prc, null, i++);
	drawcol(g, PigRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, PigRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, PigRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, PigRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, PigRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, PigRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(PigRoster.cols.get(1).hasx(c.x)) {
	    markall(Pig.class, o -> (o.hog == this.hog));
	    return(true);
	}
	if(PigRoster.cols.get(2).hasx(c.x)) {
	    markall(Pig.class, o -> (o.piglet == this.piglet));
	    return(true);
	}
	if(PigRoster.cols.get(3).hasx(c.x)) {
	    markall(Pig.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(PigRoster.cols.get(4).hasx(c.x)) {
	    markall(Pig.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: PigRoster */
src F  PigRoster.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class PigRoster extends CattleRoster<Pig> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Pig e) -> e.hog).reversed(), 20).runon(),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Pig e) -> e.piglet).reversed(), 20).runon(),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Pig e) -> e.dead).reversed(), 20).runon(),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Pig e) -> e.pregnant).reversed(), 20),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Pig e) -> e.q).reversed()),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/trufflesnout", 1), Comparator.comparing((Pig e) -> e.prc).reversed()),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Pig e) -> e.meat).reversed()),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Pig e) -> e.milk).reversed()),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Pig e) -> e.meatq).reversed()),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Pig e) -> e.milkq).reversed()),
	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Pig e) -> e.hideq).reversed()),

	new Column<Pig>(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Pig e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new PigRoster());
    }

    public Pig parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Pig ret = new Pig(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.hog = (fl & 1) != 0;
	ret.piglet = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	ret.prc = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/btn-pig", 2),
		       Resource.classres(PigRoster.class).pool.load("gfx/hud/rosters/btn-pig-d", 2)));
    }
}
code �  Pig ����   4 �	 # H
 * I
 # J	 K L M N O	 # P
 # Q?�      	 # R
 S T	 # U	 # V	 # W	 # X	 # Y	 # Z	 # [	 # \
 ] ^	 # _	 # `
 a b	 # c	 # d	 # e	 # f	 # g	 # h	 # i
 * j	 k l
  m n   t
 # u  t  t  t
 * y z meat I milk meatq milkq hideq seedq prc hog Z piglet dead pregnant <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V 	mousedown (Lhaven/Coord;I)Z StackMapTable lambda$mousedown$3 (LPig;)Z lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile Pig.java { | 8 } ~ =  � � � � � haven/res/ui/croster/Column � � � � 3 4 � � � � � 5 4 � � 6 4 � � 7 4 � � � � � � � � � 2 , � � � + , - , . , � � / , 0 , 1 , < = � � , � � Pig BootstrapMethods � � � B � � � � � � � > ? haven/res/ui/croster/Entry SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg 	PigRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend q D java/lang/Double (D)Ljava/lang/Double; quality java/lang/Integer (I)Ljava/lang/Integer; percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 # � test %(LPig;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 # �
 # �
 # � � � � E B D B C B A B "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	pig.cjava ! # *     + ,    - ,    . ,    / ,    0 ,    1 ,    2 ,    3 4    5 4    6 4    7 4     8 9  :   &     
*� -� �    ;   
     	   < =  :  �    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+�  �    ;   F         !  C  e  �  �  �  �  # C c  � !� "� #  > ?  :   �     �� �  � +� !� "� *#*� $  � %�� �  � +� !� "� *#*� &  � %�� �  � +� !� "� *#*� '  � %�� �  � +� !� "� *#*� (  � %�*+� )�    @    $### ;   6    &  ' " ( $ * : + F , H . ^ / j 0 l 2 � 3 � 4 � 6 A B  :   4     +� *� � � �    @    @ ;       3 C B  :   4     +� *� � � �    @    @ ;       / D B  :   4     +� *� � � �    @    @ ;       + E B  :   4     +� *� � � �    @    @ ;       '  o   *  p  q r s p  q v s p  q w s p  q x s F    � �   
  � � � code +  PigRoster ����   4.
 H t	  u v
  t w
  x y z
  { |
 
 }	  ~	  	  �	  �	  � �
  �	  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 & � �  � � �
 & �
 & � �  � �  � �  � �  �
 & � �  � �  � �  � � 	 � � 
 � �  � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse ([Ljava/lang/Object;)LPig; StackMapTable v � y z button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$12 (LPig;)Ljava/lang/Integer; lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 lambda$static$6 lambda$static$5 (LPig;)Ljava/lang/Double; lambda$static$4 (LPig;)Ljava/lang/Boolean; lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> *Lhaven/res/ui/croster/CattleRoster<LPig;>; 
SourceFile PigRoster.java M N I J 	PigRoster java/lang/Long � � java/lang/String Pig M � java/lang/Integer � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-pig � � � gfx/hud/rosters/btn-pig-d � � U V � � � � � � � � � � � haven/res/ui/croster/Column Name BootstrapMethods � � � o � � � � � M  gfx/hud/rosters/sex j M gfx/hud/rosters/growth gfx/hud/rosters/deadp gfx/hud/rosters/pregnant	 gfx/hud/rosters/quality
 h M gfx/hud/rosters/trufflesnout ` gfx/hud/rosters/meatquantity gfx/hud/rosters/milkquantity gfx/hud/rosters/meatquality gfx/hud/rosters/milkquality gfx/hud/rosters/hidequality gfx/hud/rosters/breedingquality !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I hog Z piglet dead pregnant doubleValue ()D q D meat milk meatq milkq hideq seedq prc haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
 &(Ljava/lang/Object;)Ljava/lang/Object;
  apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
  reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 
 
 
  &(Lhaven/Indir;Ljava/util/Comparator;)V
 
 
  
 !
 "
 #
 $ initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named%&) n o m j l j k j i j g h f ` e ` d ` c ` b ` a ` _ ` "java/lang/invoke/LambdaMetafactory metafactory+ Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;, %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	pig.cjava !  H    	 I J  K    L   M N  O        *� �    P       ;  I Q  O        � �    P       Q K    R � S T  O         � Y� �    P       T � U V  O  
    =+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    W   � � R  X Y Z [  [�    X Y Z [  [O [�    X Y Z [  [O [�    X Y Z [  [P [�    X Y Z [  [ P   N    X  Y  Z  [ & \ 7 ] E ^ V _ g ` x a � b � c � d � e � f � g � h i j  \ ]  O   @      � � � � � � �  �    P       n  o  nA U ^  O        *+� !�    P       ;
 _ `  O         *� � "�    P       O
 a `  O         *� � "�    P       M
 b `  O         *� � "�    P       L
 c `  O         *� � "�    P       K
 d `  O         *� � "�    P       I
 e `  O         *� � "�    P       H
 f `  O         *� � "�    P       F
 g h  O         *� � #�    P       D
 i j  O         *� � $�    P       B
 k j  O         *� � $�    P       A
 l j  O         *� � $�    P       @
 m j  O         *� � $�    P       ?
 n o  O        *� %�    P       =  p N  O  G     �� &Y� &Y'� (  � ) ȷ *SY� &Y� � +� � ,  � )� - � .� /SY� &Y� � 0� � 1  � )� - � .� /SY� &Y� � 2� � 3  � )� - � .� /SY� &Y� � 4� � 5  � )� - � .SY� &Y� � 6� � 7  � )� - � 8SY� &Y� � 9� � :  � )� - � 8SY� &Y� � ;� � <  � )� - � 8SY� &Y� � =� � >  � )� - � 8SY	� &Y� � ?� � @  � )� - � 8SY
� &Y� � A� � B  � )� - � 8SY� &Y� � C� � D  � )� - � 8SY� &Y� � E� � F  � )� - � 8S� G� �    P   >    <  = $ ? N @ x A � B � D � F H; Ia K� L� M� O� <  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � r   - K    q �     � � � 	 � � �	'*( codeentry     wdg PigRoster   ui/croster D  