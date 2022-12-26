package com.project.worldcupsystem.services;

import com.project.worldcupsystem.repositories.VipLoungeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VipLoungeService {
    @Autowired
    private VipLoungeRepository vipLoungeRepository;

    public VipLoungeService(VipLoungeRepository vipLoungeRepository) {
        this.vipLoungeRepository = vipLoungeRepository;
    }
}
