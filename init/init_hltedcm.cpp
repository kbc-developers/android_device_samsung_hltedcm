/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include <android-base/properties.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm8974.h"

using android::base::GetProperty;

void set_rild_libpath(char const *variant)
{
    std::string libpath("/system/vendor/lib/libsec-ril.");
    libpath += variant;
    libpath += ".so";
    property_override("rild.libpath", libpath.c_str());
}

void gsm_properties(char const *rild_lib_variant)
{
    set_rild_libpath(rild_lib_variant);

    property_set("ro.telephony.default_network", "9");
    property_set("telephony.lteOnGsmDevice", "1");
    property_set("ro.ril.enable.dcm.feature", "1");
}

void init_target_properties()
{
//    std::string platform = GetProperty("ro.board.platform", "");
//    if (platform != ANDROID_TARGET)
//        return;
    std::string bootloader = GetProperty("ro.bootloader", "");

    property_override("ro.build.fingerprint", "samsung/SC-01F/SC-01F:5.0/LRX21V/SC01FOMUGOI4:user/release-keys");
    property_override("ro.build.description", "hltedcm-user 5.0 LRX21V SC01FOMUGOI4 release-keys");
    property_override("ro.product.model", "SC-01F");
    property_override("ro.product.device", "SC-01F");
    gsm_properties("tmo");	//temporary,set tmo

    std::string device = GetProperty("ro.product.device", "");
    LOG(INFO) << "Found bootloader id " << bootloader <<  " setting build properties for "
	    << device <<  " device" << std::endl;
}
