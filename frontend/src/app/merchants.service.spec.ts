import { TestBed, inject } from '@angular/core/testing';

import { MerchantsService } from './merchants.service';

describe('MerchantsService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [MerchantsService]
    });
  });

  it('should be created', inject([MerchantsService], (service: MerchantsService) => {
    expect(service).toBeTruthy();
  }));
});
