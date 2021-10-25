package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.SpuPoster;
import com.bluecc.bluesrv.gmall.service.ISpuPosterService;

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
 *  SpuPosterController
 *  <pre>
 *  $ curl localhost:8088/gmall/spu_poster/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/spu_poster")
public class SpuPosterController {
    private static final Logger logger = LoggerFactory.getLogger(SpuPosterController.class);

    @Autowired
    private ISpuPosterService spuPosterService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<SpuPoster> create(@RequestBody SpuPoster o)
            throws URISyntaxException {
        boolean createdStudent = spuPosterService.save(o);
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
    public ResponseEntity<SpuPoster> read(@PathVariable Integer id) {
        SpuPoster found= spuPosterService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody SpuPoster o) {
        boolean updated = spuPosterService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = spuPosterService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


