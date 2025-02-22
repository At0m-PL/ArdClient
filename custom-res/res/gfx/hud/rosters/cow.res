Haven Resource 1D src �  Ochs.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Ochs extends Entry {
    public int meat, milk;
    public int meatq, milkq, hideq;
    public int seedq;
    public boolean bull, calf, dead, pregnant;

    public Ochs(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, CowRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, bull, sex, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, calf, growth, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, dead, deadrend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, CowRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, CowRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, CowRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, CowRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(CowRoster.cols.get(1).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.bull == this.bull));
	    return(true);
	}
	if(CowRoster.cols.get(2).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.calf == this.calf));
	    return(true);
	}
	if(CowRoster.cols.get(3).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(CowRoster.cols.get(4).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: CowRoster */
src �  CowRoster.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class CowRoster extends CattleRoster<Ochs> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Ochs e) -> e.bull).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Ochs e) -> e.calf).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Ochs e) -> e.dead).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Ochs e) -> e.pregnant).reversed(), 20),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Ochs e) -> e.q).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Ochs e) -> e.meat).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Ochs e) -> e.milk).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Ochs e) -> e.meatq).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Ochs e) -> e.milkq).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Ochs e) -> e.hideq).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Ochs e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new CowRoster());
    }

    public Ochs parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Ochs ret = new Ochs(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.bull = (fl & 1) != 0;
	ret.calf = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/btn-cow", 2),
		       Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/btn-cow-d", 2)));
    }
}
code e  Ochs ����   4 �	 " F
 ) G
 " H	 I J K L M	 " N
 " O?�      	 " P
 Q R	 " S	 " T	 " U	 " V	 " W	 " X	 " Y	 " Z
 [ \	 " ]	 " ^
 _ `	 " a	 " b	 " c	 " d	 " e	 " f
 ) g	 h i
  j k   q
 " r  q  q  q
 ) v w meat I milk meatq milkq hideq seedq bull Z calf dead pregnant <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V 	mousedown (Lhaven/Coord;I)Z StackMapTable lambda$mousedown$3 	(LOchs;)Z lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 	Ochs.java x y 6 z { ; | } ~  � � haven/res/ui/croster/Column � � � � 1 2 � � � � � 3 2 � � 4 2 � � 5 2 � � � � � � � � � * + � � � , + - + � � . + / + 0 + : ; � � + � � Ochs BootstrapMethods � � � @ � � � � � � � < = haven/res/ui/croster/Entry SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg 	CowRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend q D java/lang/Double (D)Ljava/lang/Double; quality java/lang/Integer (I)Ljava/lang/Integer; percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 " � test &(LOchs;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 " �
 " �
 " � � � � C @ B @ A @ ? @ "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	cow.cjava ! " )   
  * +    , +    - +    . +    / +    0 +    1 2    3 2    4 2    5 2     6 7  8   &     
*� -� �    9   
     	   : ;  8  �    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �    9   B         !  C  e  �  �  �  �  % E e �  � !  < =  8   �     �� �  � +�  � !� *"*� #  � $�� �  � +�  � !� *"*� %  � $�� �  � +�  � !� *"*� &  � $�� �  � +�  � !� *"*� '  � $�*+� (�    >    $### 9   6    $  % " & $ ( : ) F * H , ^ - j . l 0 � 1 � 2 � 4 ? @  8   4     +� *� � � �    >    @ 9       1 A @  8   4     +� *� � � �    >    @ 9       - B @  8   4     +� *� � � �    >    @ 9       ) C @  8   4     +� *� � � �    >    @ 9       %  l   *  m  n o p m  n s p m  n t p m  n u p D    � �   
  � � � code a  CowRoster ����   4$
 E p	  q r
  p s
  t u v
  w x
 
 y	  z	  {	  |	  }	  ~ 
  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 % � �  � � �
 % �
 % � �  � �  � �  � �  �
 % � �  � �  � �  � � 	 � � 
 � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse ([Ljava/lang/Object;)LOchs; StackMapTable r � u v button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$11 (LOchs;)Ljava/lang/Integer; lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 lambda$static$6 lambda$static$5 (LOchs;)Ljava/lang/Double; lambda$static$4 (LOchs;)Ljava/lang/Boolean; lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> +Lhaven/res/ui/croster/CattleRoster<LOchs;>; 
SourceFile CowRoster.java J K F G 	CowRoster java/lang/Long � � java/lang/String Ochs J � java/lang/Integer � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-cow � � � gfx/hud/rosters/btn-cow-d � � R S � � � � � � � � � � � haven/res/ui/croster/Column Name BootstrapMethods � � � k � � � � � J � gfx/hud/rosters/sex � f � � J � � � gfx/hud/rosters/growth � gfx/hud/rosters/deadp  gfx/hud/rosters/pregnant gfx/hud/rosters/quality d J gfx/hud/rosters/meatquantity ] gfx/hud/rosters/milkquantity gfx/hud/rosters/meatquality gfx/hud/rosters/milkquality gfx/hud/rosters/hidequality gfx/hud/rosters/breedingquality	
 !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I bull Z calf dead pregnant doubleValue ()D q D meat milk meatq milkq hideq seedq haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
 &(Ljava/lang/Object;)Ljava/lang/Object;
  apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
  reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 
 
 
  &(Lhaven/Indir;Ljava/util/Comparator;)V
 
 
 
 
 
  initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named j k i f h f g f e f c d b ] a ] ` ] _ ] ^ ] \ ] "java/lang/invoke/LambdaMetafactory metafactory! Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;" %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	cow.cjava !  E    	 F G  H    I   J K  L        *� �    M       9  F N  L        � �    M       M H    O � P Q  L         � Y� �    M       P � R S  L  �    =+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    T   � � R  U V W X  X�    U V W X  XO X�    U V W X  XO X�    U V W X  XP X�    U V W X  X M   J    T  U  V  W & X 7 Y E Z V [ g \ x ] � ^ � _ � ` � a � b � c � d e  Y Z  L   @      � � � � � � � �    M       i  j  iA R [  L        *+�  �    M       9
 \ ]  L         *� � !�    M       K
 ^ ]  L         *� � !�    M       I
 _ ]  L         *� � !�    M       H
 ` ]  L         *� � !�    M       G
 a ]  L         *� � !�    M       E
 b ]  L         *� � !�    M       D
 c d  L         *� � "�    M       B
 e f  L         *� � #�    M       @
 g f  L         *� � #�    M       ?
 h f  L         *� � #�    M       >
 i f  L         *� � #�    M       =
 j k  L        *� $�    M       ;  l K  L       �� %Y� %Y&� '  � ( ȷ )SY� %Y� � *� � +  � (� , � -� .SY� %Y� � /� � 0  � (� , � -� .SY� %Y� � 1� � 2  � (� , � -� .SY� %Y� � 3� � 4  � (� , � -SY� %Y� � 5� � 6  � (� , � 7SY� %Y� � 8� � 9  � (� , � 7SY� %Y� � :� � ;  � (� , � 7SY� %Y� � <� � =  � (� , � 7SY	� %Y� � >� � ?  � (� , � 7SY
� %Y� � @� � A  � (� , � 7SY� %Y� � B� � C  � (� , � 7S� D� �    M   :    :  ; $ = N > x ? � @ � B � D E; Ga H� I� K� :  �   z  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � n   # H    m �     � � � 	 � � �	  codeentry     wdg CowRoster   ui/croster D  