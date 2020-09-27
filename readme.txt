BSVQE Software release.

=======================================================================
-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2017 University of Science and Technology of China
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
modify, and distribute this code (the source files) and its documentation for
any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Immersive Media Computing Lab (IMCL) at University of Science and Technology of China 
(USTC), is acknowledged in any publication that reports research using this code. The research is to be cited
in the bibliography as:

1)  Zhibo Chen, Wei Zhou and Weiping Li, "Blind Stereoscopic Video Quality Assessment: From Depth Perception to Overall Experience".

2)  Zhibo Chen, Wei Zhou and Weiping Li, "BSVQE Software Release", 
    URL: http://staff.ustc.edu.cn/~chenzhibo/resources.html, 2017

IN NO EVENT SHALL UNIVERSITY OF SCIENCE AND TECHNOLOGY OF CHINA BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF UNIVERSITY OF SCIENCE AND TECHNOLOGY OF CHINA
HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

UNIVERSITY OF SCIENCE AND TECHNOLOGY OF CHINA SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
AND UNIVERSITY OF SCIENCE AND TECHNOLOGY OF CHINA HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%

=======================================================================
Author  : Wei Zhou
Version : 1.0

The authors are with the Dept. of EEIS, University of Science and Technology of China, Hefei 230026, China

Kindly report any suggestions or corrections to weichou@mail.ustc.edu.cn

=======================================================================

This is a demonstration of the Blind Stereoscopic Video Quality Evaluator (BSVQE). The algorithm is described in:

Zhibo Chen, Wei Zhou and Weiping Li, "Blind Stereoscopic Video Quality Assessment: From Depth Perception to Overall Experience".

You can change this program as you like and use it anywhere, but please
refer to its original source (cite our paper and our web page at
http://staff.ustc.edu.cn/~chenzhibo/resources.html, 2017).

========================================================================

Running on Matlab 

Input : Y component of YUV video for left and right views loaded in the arrays.

Output: NSS feature and entropy feature of fusion map and suppression map respectively.
	
Note: For entropy value, higher value represents a higher depth perception quality.
  

Usage (for example):

1. Run saveNSS file:

   Obtain featureNSS.

2. Run saveDisparity_igm file: 

   Obtain featureEntropy.
 

3. Train the regression model:

 
   Use support vector regression (SVR), please see calCorr file.

=======================================================================

NOTE: Please download the MOS file in our published 3D-HEVC Stereo Video Quality Database.

========================================================================

Note on training: 
This release version of BSVQE was trained on 80% of the entire 3D-HEVC database.

========================================================================
