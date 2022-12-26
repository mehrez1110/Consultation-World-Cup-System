package com.project.worldcupsystem.controllers;

import com.project.worldcupsystem.services.VipLoungeService;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VipLoungeController {
    private VipLoungeService vipLoungeService;

    public VipLoungeController(VipLoungeService vipLoungeService) {
        this.vipLoungeService = vipLoungeService;
    }
}
