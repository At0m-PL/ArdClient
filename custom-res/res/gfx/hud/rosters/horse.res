Haven Resource 18 src �  Horse.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Horse extends Entry {
    public int meat, milk;
    public int meatq, milkq, hideq;
    public int seedq;
    public int end, stam, mb;
    public boolean stallion, foal, dead, pregnant;

    public Horse(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, HorseRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, stallion, sex, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, foal,     growth, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, dead,     deadrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, end, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, stam, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, mb, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(HorseRoster.cols.get(1).hasx(c.x)) {
	    markall(Horse.class, o -> (o.stallion == this.stallion));
	    return(true);
	}
	if(HorseRoster.cols.get(2).hasx(c.x)) {
	    markall(Horse.class, o -> (o.foal == this.foal));
	    return(true);
	}
	if(HorseRoster.cols.get(3).hasx(c.x)) {
	    markall(Horse.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(HorseRoster.cols.get(4).hasx(c.x)) {
	    markall(Horse.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: HorseRoster */
src   HorseRoster.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class HorseRoster extends CattleRoster<Horse> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Horse e) -> e.stallion).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Horse e) -> e.foal).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Horse e) -> e.dead).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Horse e) -> e.pregnant).reversed(), 20),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Horse e) -> e.q).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/endurance", 1), Comparator.comparing((Horse e) -> e.end).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/stamina", 1), Comparator.comparing((Horse e) -> e.stam).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/metabolism", 1), Comparator.comparing((Horse e) -> e.mb).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Horse e) -> e.meat).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Horse e) -> e.milk).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Horse e) -> e.meatq).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Horse e) -> e.milkq).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Horse e) -> e.hideq).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Horse e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new HorseRoster());
    }

    public Horse parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Horse ret = new Horse(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.stallion = (fl & 1) != 0;
	ret.foal = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	ret.end = (Integer)args[n++];
	ret.stam = (Integer)args[n++];
	ret.mb = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/btn-horse", 2),
		       Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/btn-horse-d", 2)));
    }
}
code    Horse ����   4 �	 % L
 , M
 % N	 O P Q R S	 % T
 % U?�      	 % V
 W X	 % Y	 % Z	 % [	 % \	 % ]	 % ^	 % _	 % `
 a b	 % c	 % d
 e f	 % g	 % h	 % i	 % j	 % k	 % l	 % m	 % n	 % o
 , p	 q r
  s t   z
 % {  z  z  z
 ,  � meat I milk meatq milkq hideq seedq end stam mb stallion Z foal dead pregnant <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V 	mousedown (Lhaven/Coord;I)Z StackMapTable lambda$mousedown$3 
(LHorse;)Z lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 
Horse.java � � < � � A � � � � � � haven/res/ui/croster/Column � � � � 7 8 � � � � � 9 8 � � : 8 � � ; 8 � � � � � � � � � 4 . � � � 5 . 6 . - . / . 0 . � � 1 . 2 . 3 . @ A � � . � � Horse BootstrapMethods � � � F � � � � � � � B C haven/res/ui/croster/Entry SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg HorseRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend q D java/lang/Double (D)Ljava/lang/Double; quality java/lang/Integer (I)Ljava/lang/Integer; percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 % � test '(LHorse;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 % �
 % �
 % � � � � I F H F G F E F "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles horse.cjava ! % ,     - .    / .    0 .    1 .    2 .    3 .    4 .    5 .    6 .    7 8    9 8    : 8    ; 8     < =  >   &     
*� -� �    ?   
     	   @ A  >  C    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *�  � � �� *+� �  � *� !� �� *+� "�    ?   N         !  C  e  �  �  �  �  # A _   !� "� #� $� %  B C  >   �     �� �  � +� #� $� *%*� &  � '�� �  � +� #� $� *%*� (  � '�� �  � +� #� $� *%*� )  � '�� �  � +� #� $� *%*� *  � '�*+� +�    D    $### ?   6    (  ) " * $ , : - F . H 0 ^ 1 j 2 l 4 � 5 � 6 � 8 E F  >   4     +� *� � � �    D    @ ?       5 G F  >   4     +� *� � � �    D    @ ?       1 H F  >   4     +� *� � � �    D    @ ?       - I F  >   4     +� *� � � �    D    @ ?       )  u   *  v  w x y v  w | y v  w } y v  w ~ y J    � �   
  � � � code �  HorseRoster ����   4B
 N |	  } ~
  | 
  � � �
  � �
 
 �	  �	  �	  �	  �	  � �
  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 ( � �  � � �
 ( �
 ( � �  � �  � �  � �  �
 ( � �  � �  � �  � � 	 � � 
 � �  � �  � �  � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse ([Ljava/lang/Object;)LHorse; StackMapTable ~ � � � button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$14 (LHorse;)Ljava/lang/Integer; lambda$static$13 lambda$static$12 lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 lambda$static$6 lambda$static$5 (LHorse;)Ljava/lang/Double; lambda$static$4 (LHorse;)Ljava/lang/Boolean; lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> ,Lhaven/res/ui/croster/CattleRoster<LHorse;>; 
SourceFile HorseRoster.java S T O P HorseRoster java/lang/Long � � java/lang/String Horse S � java/lang/Integer � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-horse � � � gfx/hud/rosters/btn-horse-d � � [ \ �  � � haven/res/ui/croster/Column Name BootstrapMethods	
 w S gfx/hud/rosters/sex r S gfx/hud/rosters/growth gfx/hud/rosters/deadp gfx/hud/rosters/pregnant gfx/hud/rosters/quality p S gfx/hud/rosters/endurance f gfx/hud/rosters/stamina gfx/hud/rosters/metabolism gfx/hud/rosters/meatquantity gfx/hud/rosters/milkquantity  gfx/hud/rosters/meatquality! gfx/hud/rosters/milkquality" gfx/hud/rosters/hidequality# gfx/hud/rosters/breedingquality$%& !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I stallion Z foal dead pregnant doubleValue ()D q D meat milk meatq milkq hideq seedq end stam mb haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load' Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
() &(Ljava/lang/Object;)Ljava/lang/Object;
 * apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
 + reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 ,
 -
 .
 / &(Lhaven/Indir;Ljava/util/Comparator;)V
 0
 1
 2
 3
 4
 5
 6
 7
 8 initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named9:= v w u r t r s r q r o p n f m f l f k f j f i f h f g f e f "java/lang/invoke/LambdaMetafactory metafactory? Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;@ %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles horse.cjava !  N    	 O P  Q    R   S T  U        *� �    V       =  O W  U        � �    V       U Q    X � Y Z  U         � Y� �    V       X � [ \  U  4    7=+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    ]   � � R  ^ _ ` a  a�    ^ _ ` a  aO a�    ^ _ ` a  aO a�    ^ _ ` a  aP a�    ^ _ ` a  a V   V    \  ]  ^  _ & ` 7 a E b V c g d x e � f � g � h � i � j � k � l m n# o4 p  b c  U   @      � � �  � � !�  � "�    V       t  u  tA [ d  U        *+� #�    V       =
 e f  U         *� � $�    V       S
 g f  U         *� � $�    V       Q
 h f  U         *� � $�    V       P
 i f  U         *� � $�    V       O
 j f  U         *� � $�    V       M
 k f  U         *� � $�    V       L
 l f  U         *� � $�    V       J
 m f  U         *� � $�    V       I
 n f  U         *� � $�    V       H
 o p  U         *� � %�    V       F
 q r  U         *� � &�    V       D
 s r  U         *� � &�    V       C
 t r  U         *� � &�    V       B
 u r  U         *� � &�    V       A
 v w  U        *� '�    V       ?  x T  U  �     C� (Y� (Y)� *  � + ȷ ,SY� (Y� � -�  � .  � +� / � 0� 1SY� (Y� � 2�  � 3  � +� / � 0� 1SY� (Y� � 4�  � 5  � +� / � 0� 1SY� (Y� � 6�  � 7  � +� / � 0SY� (Y� � 8�  � 9  � +� / � :SY� (Y� � ;�  � <  � +� / � :SY� (Y� � =�  � >  � +� / � :SY� (Y� � ?�  � @  � +� / � :SY	� (Y� � A�  � B  � +� / � :SY
� (Y� � C�  � D  � +� / � :SY� (Y� � E�  � F  � +� / � :SY� (Y� � G�  � H  � +� / � :SY� (Y� � I�  � J  � +� / � :SY� (Y� � K�  � L  � +� / � :S� M� �    V   F    >  ? $ A N B x C � D � F � H I; Ja L� M� O� P� Q S< >  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � z   A Q    y �     � � � 	 � � �	;>< codeentry "   wdg HorseRoster   ui/croster D  