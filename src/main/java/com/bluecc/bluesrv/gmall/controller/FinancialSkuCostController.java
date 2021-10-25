package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.FinancialSkuCost;
import com.bluecc.bluesrv.gmall.service.IFinancialSkuCostService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * <p>
 *  FinancialSkuCostController
 *  <pre>
 *  $ curl localhost:8088/gmall/financial_sku_cost/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/financial_sku_cost")
public class FinancialSkuCostController {
    private static final Logger logger = LoggerFactory.getLogger(FinancialSkuCostController.class);

    @Autowired
    private IFinancialSkuCostService financialSkuCostService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<FinancialSkuCost> create(@RequestBody FinancialSkuCost o)
            throws URISyntaxException {
        boolean createdStudent = financialSkuCostService.save(o);
        if (!createdStudent) {
            return ResponseEntity.notFound().build();
        } else {
            URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                    .path("/{id}")
                    .buildAndExpand(o.getId())
                    .toUri();

            return ResponseEntity.created(uri)
                    .body(o);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<FinancialSkuCost> read(@PathVariable Integer id) {
        FinancialSkuCost found= financialSkuCostService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody FinancialSkuCost o) {
        boolean updated = financialSkuCostService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = financialSkuCostService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


