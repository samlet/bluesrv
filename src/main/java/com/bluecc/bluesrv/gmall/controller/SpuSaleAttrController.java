package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.SpuSaleAttr;
import com.bluecc.bluesrv.gmall.service.ISpuSaleAttrService;

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
 *  SpuSaleAttrController
 *  <pre>
 *  $ curl localhost:8088/gmall/spu_sale_attr/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/spu_sale_attr")
public class SpuSaleAttrController {
    private static final Logger logger = LoggerFactory.getLogger(SpuSaleAttrController.class);

    @Autowired
    private ISpuSaleAttrService spuSaleAttrService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<SpuSaleAttr> create(@RequestBody SpuSaleAttr o)
            throws URISyntaxException {
        boolean createdStudent = spuSaleAttrService.save(o);
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
    public ResponseEntity<SpuSaleAttr> read(@PathVariable Integer id) {
        SpuSaleAttr found= spuSaleAttrService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody SpuSaleAttr o) {
        boolean updated = spuSaleAttrService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = spuSaleAttrService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


