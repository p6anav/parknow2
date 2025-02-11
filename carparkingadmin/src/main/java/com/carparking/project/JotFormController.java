package com.carparking.project;

import com.carparking.project.helper.QRcodereader;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/jotform")
public class JotFormController {
    private final QRcodereader jotFormService;

    public JotFormController(QRcodereader jotFormService) {
        this.jotFormService = jotFormService;
    }

    @GetMapping("/fetch/{formId}")
    public String fetchJotForm(@PathVariable String formId) {
        return jotFormService.fetchForm(formId);
    }
}

