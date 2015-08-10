import Data.List
import Numeric
import Data.Char
import Data.Bits
import Data.Ord

--cabal install split
import Data.List.Split
--cabal install hex
import Data.Hex
--cabal install missingh
import Data.List.Utils

ciphertext1 = "315c4eeaa8b5f8aaf9174145bf43e1784b8fa00dc71d885a804e5ee9fa40b16349c146fb778cdf2d3aff021dfff5b403b510d0d0455468aeb98622b137dae857553ccd8883a7bc37520e06e515d22c954eba5025b8cc57ee59418ce7dc6bc41556bdb36bbca3e8774301fbcaa3b83b220809560987815f65286764703de0f3d524400a19b159610b11ef3e"
ciphertext2 = "234c02ecbbfbafa3ed18510abd11fa724fcda2018a1a8342cf064bbde548b12b07df44ba7191d9606ef4081ffde5ad46a5069d9f7f543bedb9c861bf29c7e205132eda9382b0bc2c5c4b45f919cf3a9f1cb74151f6d551f4480c82b2cb24cc5b028aa76eb7b4ab24171ab3cdadb8356f"
ciphertext3 = "32510ba9a7b2bba9b8005d43a304b5714cc0bb0c8a34884dd91304b8ad40b62b07df44ba6e9d8a2368e51d04e0e7b207b70b9b8261112bacb6c866a232dfe257527dc29398f5f3251a0d47e503c66e935de81230b59b7afb5f41afa8d661cb"
ciphertext4 = "32510ba9aab2a8a4fd06414fb517b5605cc0aa0dc91a8908c2064ba8ad5ea06a029056f47a8ad3306ef5021eafe1ac01a81197847a5c68a1b78769a37bc8f4575432c198ccb4ef63590256e305cd3a9544ee4160ead45aef520489e7da7d835402bca670bda8eb775200b8dabbba246b130f040d8ec6447e2c767f3d30ed81ea2e4c1404e1315a1010e7229be6636aaa"
ciphertext5 = "3f561ba9adb4b6ebec54424ba317b564418fac0dd35f8c08d31a1fe9e24fe56808c213f17c81d9607cee021dafe1e001b21ade877a5e68bea88d61b93ac5ee0d562e8e9582f5ef375f0a4ae20ed86e935de81230b59b73fb4302cd95d770c65b40aaa065f2a5e33a5a0bb5dcaba43722130f042f8ec85b7c2070"
ciphertext6 = "32510bfbacfbb9befd54415da243e1695ecabd58c519cd4bd2061bbde24eb76a19d84aba34d8de287be84d07e7e9a30ee714979c7e1123a8bd9822a33ecaf512472e8e8f8db3f9635c1949e640c621854eba0d79eccf52ff111284b4cc61d11902aebc66f2b2e436434eacc0aba938220b084800c2ca4e693522643573b2c4ce35050b0cf774201f0fe52ac9f26d71b6cf61a711cc229f77ace7aa88a2f19983122b11be87a59c355d25f8e4"
ciphertext7 = "32510bfbacfbb9befd54415da243e1695ecabd58c519cd4bd90f1fa6ea5ba47b01c909ba7696cf606ef40c04afe1ac0aa8148dd066592ded9f8774b529c7ea125d298e8883f5e9305f4b44f915cb2bd05af51373fd9b4af511039fa2d96f83414aaaf261bda2e97b170fb5cce2a53e675c154c0d9681596934777e2275b381ce2e40582afe67650b13e72287ff2270abcf73bb028932836fbdecfecee0a3b894473c1bbeb6b4913a536ce4f9b13f1efff71ea313c8661dd9a4ce"
ciphertext8 = "315c4eeaa8b5f8bffd11155ea506b56041c6a00c8a08854dd21a4bbde54ce56801d943ba708b8a3574f40c00fff9e00fa1439fd0654327a3bfc860b92f89ee04132ecb9298f5fd2d5e4b45e40ecc3b9d59e9417df7c95bba410e9aa2ca24c5474da2f276baa3ac325918b2daada43d6712150441c2e04f6565517f317da9d3"
ciphertext9 = "271946f9bbb2aeadec111841a81abc300ecaa01bd8069d5cc91005e9fe4aad6e04d513e96d99de2569bc5e50eeeca709b50a8a987f4264edb6896fb537d0a716132ddc938fb0f836480e06ed0fcd6e9759f40462f9cf57f4564186a2c1778f1543efa270bda5e933421cbe88a4a52222190f471e9bd15f652b653b7071aec59a2705081ffe72651d08f822c9ed6d76e48b63ab15d0208573a7eef027"
ciphertext10 = "466d06ece998b7a2fb1d464fed2ced7641ddaa3cc31c9941cf110abbf409ed39598005b3399ccfafb61d0315fca0a314be138a9f32503bedac8067f03adbf3575c3b8edc9ba7f537530541ab0f9f3cd04ff50d66f1d559ba520e89a2cb2a83"
target       = "32510ba9babebbbefd001547a810e67149caee11d945cd7fc81a05e9f85aac650e9052ba6a8cd8257bf14d13e6f0a803b54fde9e77472dbff89d71b57bddef121336cb85ccb8f3315f4b52e301d16e9f52f904"

--parsing
toHex x = map ("0x"++) (splitEvery 2 x)
x1 = toHex ciphertext1
x2 = toHex ciphertext2
x3 = toHex ciphertext3
x4 = toHex ciphertext4
x5 = toHex ciphertext5
x6 = toHex ciphertext6
x7 = toHex ciphertext7
x8 = toHex ciphertext8
x9 = toHex ciphertext9
x10 = toHex ciphertext10
xtarget = toHex target


print_length x = show(length x1)
hexxor_int x y = showHex(xor x y) ""
hexxor_str x y = showHex(xor (read(x)::Int) (read(y)::Int)) ""
cipherxor c1 c2 = zipWith (hexxor_str) c1 c2
letter_frequency x = map (\x -> (head x, length x)) $ group $ sort x
sorted_frequency x = sortBy (comparing $ snd) x

cipher_lengths = do { putStrLn "=====Cipher Lengths=====" ;
putStr "Cipher1 " ; putStrLn (show(length x1)) ;
putStr "Cipher2 " ; putStrLn (show(length x2)) ;
putStr "Cipher3 " ; putStrLn (show(length x3)) ;
putStr "Cipher4 " ; putStrLn (show(length x4)) ;
putStr "Cipher5 " ; putStrLn (show(length x5)) ;
putStr "Cipher6 " ; putStrLn (show(length x6)) ;
putStr "Cipher7 " ; putStrLn (show(length x7)) ;
putStr "Cipher8 " ; putStrLn (show(length x8)) ;
putStr "Cipher9 " ; putStrLn (show(length x9)) ;
putStr "Cipher10 " ; putStrLn (show(length x10)) ;
putStr "Target " ; putStrLn (show(length xtarget)) ;
}

--crib drag time

--xtarget The secret message is: When using a stream cipher, never use the key more than once
--x1
--x2 Euler would probably enjoy that now
--x3
--x4 The ciphertext produced by a weak encryption algorithm looks as good as ciphertext produced by a strong encryption algorithm.
--x5 You don't want to buy a set of car keys  
--x6 There are two types of cryptography 
--x7
--x8
--x9 A (private-key)  encryption scheme

crib_offset = ["0x20"]
crib_maker input = map ("0x"++) (map (hex) (splitEvery 1 input))

crib1= crib_maker "The ciphertext produced by a weak encryption algorithm looks as good as ciphertext produced by a strong encryption algorithm."
c1 = crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1 ++ crib1
c2 = crib_offset ++ c1
c3 = crib_offset ++ c2
c4 = crib_offset ++ c3
c5 = crib_offset ++ c4
c_once = replicate 100 "0x75"

--m XOR m
pivot = x4
p_tar = cipherxor pivot xtarget
p1 = cipherxor pivot x1
p2 = cipherxor pivot x2
p3 = cipherxor pivot x3
p4 = cipherxor pivot x4
p5 = cipherxor pivot x5
p6 = cipherxor pivot x6
p7 = cipherxor pivot x7
p8 = cipherxor pivot x8
p9 = cipherxor pivot x9

p10 = cipherxor x2 x3
p11 = cipherxor x2 x4
p12 = cipherxor x2 x5
p13 = cipherxor x2 x6
p14 = cipherxor x2 x7
p15 = cipherxor x2 x8
p16 = cipherxor x2 x9
p17 = cipherxor x2 x10

p18 = cipherxor x3 x4

--Add hex prefix
z_tar = map ("0x"++) p_tar
z1 = map ("0x"++) p1
z2 = map ("0x"++) p2
z3 = map ("0x"++) p3
z4 = map ("0x"++) p4
z5 = map ("0x"++) p5
z6 = map ("0x"++) p6
z7 = map ("0x"++) p7
z8 = map ("0x"++) p8
z9 = map ("0x"++) p9
z10 = map ("0x"++) p10
z11 = map ("0x"++) p11
z12 = map ("0x"++) p12
z13 = map ("0x"++) p13
z14 = map ("0x"++) p14
z15 = map ("0x"++) p15
z16 = map ("0x"++) p16
z17 = map ("0x"++) p17
z18 = map ("0x"++) p18


crib_drag mm = cipherxor c1 mm

post_drag_tar = crib_drag z_tar
post_drag1 = crib_drag z1
post_drag2 = crib_drag z2
post_drag3 = crib_drag z3
post_drag4 = crib_drag z4
post_drag5 = crib_drag z5
post_drag6 = crib_drag z6
post_drag7 = crib_drag z7
post_drag8 = crib_drag z8
post_drag9 = crib_drag z9
post_drag10 = crib_drag z10
post_drag11 = crib_drag z11
post_drag12 = crib_drag z12
post_drag13 = crib_drag z13
post_drag14 = crib_drag z14
post_drag15 = crib_drag z15
post_drag16 = crib_drag z16
post_drag17 = crib_drag z17
post_drag18 = crib_drag z18

dump_drag_tar = replace "\n" " " (unlines post_drag_tar)
dump_drag1 = replace "\n" " " (unlines post_drag1)
dump_drag2 = replace "\n" " " (unlines post_drag2)
dump_drag3 = replace "\n" " " (unlines post_drag3)
dump_drag4 = replace "\n" " " (unlines post_drag4)
dump_drag5 = replace "\n" " " (unlines post_drag5)
dump_drag6 = replace "\n" " " (unlines post_drag6)
dump_drag7 = replace "\n" " " (unlines post_drag7)
dump_drag8 = replace "\n" " " (unlines post_drag8)
dump_drag9 = replace "\n" " " (unlines post_drag9)
dump_drag10 = replace "\n" " " (unlines post_drag10)
dump_drag11 = replace "\n" " " (unlines post_drag11)
dump_drag12 = replace "\n" " " (unlines post_drag12)
dump_drag13 = replace "\n" " " (unlines post_drag13)
dump_drag14 = replace "\n" " " (unlines post_drag14)
dump_drag15 = replace "\n" " " (unlines post_drag15)
dump_drag16 = replace "\n" " " (unlines post_drag16)
dump_drag17 = replace "\n" " " (unlines post_drag17)
dump_drag18 = replace "\n" " " (unlines post_drag18)

deHex (x:xs) = if   (length xs /= 0)
               then (unhex x) ++ (deHex xs)
               else (unhex x)

drag_result x = replace "\n" " " (unlines (deHex x))

print_drag_result = do { putStrLn "=====!!!===" ;
putStr "Result of drag on pivot " ; putStrLn (show(pivot)) ;
putStr "Cipher1 " ; putStrLn (show(drag_result post_drag1)) ;
putStr "Cipher2 " ; putStrLn (show(drag_result post_drag2)) ;
putStr "Cipher3 " ; putStrLn (show(drag_result post_drag3)) ;
putStr "Cipher4 " ; putStrLn (show(drag_result post_drag4)) ;
putStr "Cipher5 " ; putStrLn (show(drag_result post_drag5)) ;
putStr "Cipher6 " ; putStrLn (show(drag_result post_drag6)) ;
putStr "Cipher7 " ; putStrLn (show(drag_result post_drag7)) ;
putStr "Cipher8 " ; putStrLn (show(drag_result post_drag8)) ;
putStr "Cipher9 " ; putStrLn (show(drag_result post_drag9)) ;
putStr "Cipher10 "; putStrLn(show(drag_result post_drag10)) ;
putStr "Target "  ; putStrLn  (show(drag_result post_drag_tar)) ;
}